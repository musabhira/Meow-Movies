import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/appbar_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/comment_bottom_sheet.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/review_section_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/vedio_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/youtube_widget.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

const imagePath = 'https://image.tmdb.org/t/p/original';

class MyHerp extends ConsumerWidget {
  final MovieEntity modelData1;
  // final List<ReviewEntity> modelData2;

  const MyHerp({
    super.key,
    required this.modelData1,
  });
  static const routePath = '/myHerp';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 62, 63),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: MyAppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  width: double.infinity,
                  height: 800,
                  color: const Color.fromARGB(255, 12, 1, 31),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 500,
                                height: 600,
                                color: const Color.fromARGB(255, 12, 1, 31),
                                child: SizedBox(
                                  width: 200,
                                  child: Image.network(
                                      "$imagePath${modelData1.posterPath}"),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {
                                ref
                                    .read(movieProvider.notifier)
                                    .addToFiresore(modelData1);
                              },
                              color: AppTheme.of(context).colors.textInverse,
                            ),
                          ],
                        ),
                        Text(modelData1.title,
                            style: AppTheme.of(context).typography.h700),
                        Row(
                          children: [
                            SizedBox(
                              width: 350,
                              child: Text(
                                modelData1.originalTitle,
                                style: AppTheme.of(context).typography.small,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 350,
                          child: Text(modelData1.overview,
                              style:
                                  AppTheme.of(context).typography.uiSemibold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {
                            _showCommentBottomSheet(context, modelData1);
                            // CommentBottomSheetWidget(modelData1: modelData1);
                          },
                          color: AppTheme.of(context).colors.textInverse,
                        ),
                        SizedBox(
                          width: 250,
                          // height: 00,
                          child: YoutubePlayerWidget(modelData1: modelData1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Reviewsectionwidget(movieEntity: modelData1),
                        ),
                        const SizedBox(
                          height: 130,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showCommentBottomSheet(
  BuildContext context,
  MovieEntity movieEntity,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return CommentBottomSheetWidget(
        modelData1: movieEntity,
      );
    },
  );
}
