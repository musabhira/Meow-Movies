import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/pages/inHome_page.dart';

import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class CustomWatch extends ConsumerWidget {
  final List<MovieEntity> value;
  static const imagePath = 'https://image.tmdb.org/t/p/original';

  const CustomWatch({super.key, required this.value});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    return Container(
      height: theme.spaces.space_100 * 29.5,
      color: AppTheme.of(context).colors.textSubtlest,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () =>
                        context.push(MyHerp.routePath, extra: value[index]),
                    child: Column(
                      children: [
                        Image.network(
                          '$imagePath${value[index].posterPath}',
                          fit: BoxFit.fill,
                          height: 200, // Adjust the height as needed
                        ),
                        Text(
                          value[index].title,
                          style: theme.typography.pDefault,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
