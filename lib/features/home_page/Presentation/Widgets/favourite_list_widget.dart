import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/pages/inHome_page.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class FavourListWidget extends ConsumerWidget {
  final List<MovieEntity> modelData;
  const FavourListWidget({super.key, required this.modelData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    // const imagePath1 = imagePath;
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          context.push(
            MyHerp.routePath,
            extra: modelData[index],
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: appTheme.spaces.space_100 * 16,
                        height: appTheme.spaces.space_100 * 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            imagePath + modelData[index].posterPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: appTheme.spaces.space_100,
                      ),
                      SizedBox(
                        width: appTheme.spaces.space_100 * 28,
                        height: appTheme.spaces.space_100 * 15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${modelData[index].title}(${modelData[index].releaseDate.year})',
                              style: appTheme.typography.h500,
                            ),
                            Text(
                              'Release Date: ${modelData[index].releaseDate.year}',
                            ),
                            Text(
                              '⭐ ${modelData[index].voteAverage.toStringAsFixed(1)} (${modelData[index].voteCount})',
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(movieProvider.notifier)
                                    .removeFavMoviesFromFirestore(
                                        modelData[index].id.toString());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppTheme.of(context).colors.textInverse,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Icon(
                                Icons.delete,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: modelData.length,
    );
  }
}
