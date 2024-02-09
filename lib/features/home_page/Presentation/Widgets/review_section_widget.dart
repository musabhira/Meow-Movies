import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/review_list_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/try_again_buttom_widget.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class Reviewsectionwidget extends HookConsumerWidget {
  final MovieEntity movieEntity;
  const Reviewsectionwidget({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewController = useTextEditingController();
    final appTheme = AppTheme.of(context);
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: appTheme.colors.textSubtle.withOpacity(0.2),
          borderRadius: BorderRadius.circular(appTheme.spaces.space_200),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appTheme.spaces.space_150),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Comment Here',
                style: appTheme.typography.h400,
              ),
              Icon(
                Icons.ads_click_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.all(appTheme.spaces.space_100),
          height: appTheme.spaces.space_800 * 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appTheme.colors
                    .textSubtlest, // Replace with your gradient start color
                appTheme
                    .colors.textSubtle, // Replace with your gradient end color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(appTheme.spaces.space_300),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: TextField(
                        controller: reviewController,
                        maxLines: 3,
                        style: appTheme.typography.h300, // Set the text style
                        decoration: InputDecoration(
                          hintText: 'Type your comment here...',
                          filled: true,
                          fillColor: appTheme
                              .colors.textSubtle, // Set background color
                          contentPadding: EdgeInsets.all(
                              appTheme.spaces.space_100), // Set padding
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                appTheme.spaces.space_200), // Set border radius
                            borderSide: BorderSide.none, // Remove border line
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(appTheme
                                .spaces.space_200), // Set focused border radius
                            borderSide: BorderSide(
                                color: appTheme.colors.gradient2,
                                width:
                                    2.0), // Set focused border color and width
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          ref.read(movieProvider.notifier).addToReviews(
                              ReviewEntity(
                                  review: reviewController.text,
                                  username: FirebaseAuth.instance.currentUser
                                      .toString(),
                                  time: DateTime.now()),
                              '${movieEntity.title}${movieEntity.id}');
                          reviewController.clear();
                        },
                        icon: const Icon(Icons.send_outlined))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                  stream: ref
                      .watch(movieProvider.notifier)
                      .getReviewsFromFirestore(
                          '${movieEntity.title}${movieEntity.id}'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ReviewListWidget(data: data);
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: TryAgainButtonWidget(
                          error: '',
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
