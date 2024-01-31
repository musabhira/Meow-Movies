import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/theme/app_theme.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meow_films/features/home_page/Presentation/pages/inHome_page.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
// Import the file with your constant values

class WatchMovies extends ConsumerWidget {
  final List<MovieEntity> value;
  const WatchMovies({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.all(theme.spaces.space_125),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(theme.spaces.space_100),
        child: Container(
          width: theme.spaces.space_100 * 50,
          height: theme.spaces.space_100 * 47,
          color: AppTheme.of(context).colors.textSubtlest,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemCount: value.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      context.push(MyHerp.routePath, extra: value[index]);
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        height: theme.spaces.space_100 * 50.5,
                        width: theme.spaces.space_100 * 3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              theme.colors.gradient1,
                              theme.colors.gradient2,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: EdgeInsets.all(theme.spaces.space_125),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              height: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '$imagePath${value[index].posterPath}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                                height: AppTheme.of(context).spaces.space_200),
                            Padding(
                              padding: EdgeInsets.all(theme.spaces.space_100),
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating:
                                        value[index].voteAverage.toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${value[index].voteAverage}",
                                    style: AppTheme.of(context)
                                        .typography
                                        .smallSemibold,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: AppTheme.of(context).spaces.space_200),
                            SizedBox(
                              width: 250,
                              child: Center(
                                child: Text(
                                  value[index].title,
                                  style: AppTheme.of(context).typography.h600,
                                ),
                              ),
                            ),
                          ],
                        ),
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
