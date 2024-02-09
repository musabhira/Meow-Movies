import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/pages/inHome_page.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class CategoryTitleWidget extends ConsumerWidget {
  final List<MovieEntity> value;
  const CategoryTitleWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1),
        child: Container(
          width: double.infinity,
          height: 400,
          color: AppTheme.of(context).colors.textSubtlest,
          child: CarouselSlider.builder(
            itemCount: value.length,
            options: CarouselOptions(
              // height: 400,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 4),
              // autoPlayAnimationDuration:
              //     Duration(milliseconds: 800),
              // enableInfiniteScroll: true,
              height: AppTheme.of(context).spaces.space_100 * 62.5,
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (context, index, realIndex) {
              final postPathFile = File(value[index].posterPath);

              late final ImageProvider image;
              if (postPathFile.existsSync()) {
                image = FileImage(postPathFile);
              } else {
                image = NetworkImage(imagePath + value[index].posterPath);
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      context.push(MyHerp.routePath, extra: value[index]);
                    },
                    child: Container(
                      height: AppTheme.of(context).spaces.space_100 * 12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colors
                                .gradient1, // You can customize the gradient colors
                            theme.colors.gradient2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      padding: EdgeInsets.all(theme.spaces.space_200),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '$imagePath${value[index].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Center(
                              child: Text(
                                value[index].title,
                                style: TextStyle(
                                  color:
                                      AppTheme.of(context).colors.textInverse,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
