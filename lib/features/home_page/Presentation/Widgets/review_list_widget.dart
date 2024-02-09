import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class ReviewListWidget extends StatelessWidget {
  final List<ReviewEntity> data;
  const ReviewListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: appTheme.spaces.space_150,
            ),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final now = DateTime.now();
          final time = data[index].time;
          final reviewTime = DateTime(time.year, time.month, time.day);
          // final difference = now.difference(reviewTime).inMinutes;
          return Container(
            padding: EdgeInsets.all(appTheme.spaces.space_100),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  appTheme.colors.gradient1,
                  appTheme.colors.gradient2,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                topLeft:
                    Radius.circular(30.0), // Set the top right corner radius
                bottomRight:
                    Radius.circular(50.0), // Set the bottom left corner radius
              ),
            ),
            // decoration: BoxDecoration(
            //     color: appTheme.colors.textSubtle,
            //     borderRadius: BorderRadius.circular(appTheme.spaces.space_200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: FirebaseAuth.instance.currentUser?.email
                              ?.toString() ??
                          'Musab Hira',
                      style: appTheme.typography.h600,
                      children: [
                        TextSpan(
                          text: '    ${time.toString().substring(0, 10)}',
                          style: appTheme.typography.h400,
                        )
                      ]),
                ),
                Text(
                  data[index].review,
                  style: appTheme.typography.h400,
                )
              ],
            ),
          );
        });
  }
}
