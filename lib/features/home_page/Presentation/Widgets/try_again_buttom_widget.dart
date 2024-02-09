import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';

class TryAgainButtonWidget extends ConsumerWidget {
  final String error;
  const TryAgainButtonWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(error),
          TextButton(
              onPressed: () {
                ref.invalidate(movieProvider);
              },
              child: const Text('Try again')),
        ],
      ),
    );
  }
}
