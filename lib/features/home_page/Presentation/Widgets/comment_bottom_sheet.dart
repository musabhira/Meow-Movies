import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/pages/comment_view_page.dart';

import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

class CommentBottomSheetWidget extends HookConsumerWidget {
  final MovieEntity modelData1;

  static final TextEditingController commentController =
      TextEditingController();

  const CommentBottomSheetWidget({super.key, required this.modelData1});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add a Comment',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: commentController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Type your comment here...',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ref.read(movieProvider.notifier).addToReviews(
                  ReviewEntity(
                      review: commentController.text,
                      username: FirebaseAuth.instance.currentUser.toString(),
                      time: DateTime.now()),
                  '${modelData1.title}${modelData1.id}');
              commentController.clear();
            },
            child: Text('Add Comment'),
          ),
          const SizedBox(height: 10),
          // CommentViewPage(modelData: modelData)
        ],
      ),
    );
  }
}
