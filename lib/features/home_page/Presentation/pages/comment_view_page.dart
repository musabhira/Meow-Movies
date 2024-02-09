import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/try_again_buttom_widget.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class CommentViewPage extends ConsumerWidget {
  final List<ReviewEntity> modelData;
  // final String comments;
  CommentViewPage({required this.modelData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.of(context).colors.gradient1,
                  AppTheme.of(context).colors.gradient2
                ], // Add your desired gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: switch (ref.watch(movieProvider)) {
              AsyncData(:final value) => SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount: modelData.length,
                          itemBuilder: (context, index) => Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comment ${index + 1}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${modelData[index]}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
              AsyncError(:final error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString()),
                    const TryAgainButtonWidget(
                      error: '',
                    ),
                  ],
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
            }),
      ),
    );
  }
} 
// Card(
//                         elevation: 3,
//                         margin: const EdgeInsets.symmetric(vertical: 8),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Comment ${index + 1}',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 comments[index],
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
