import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/appbar_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/favourite_list_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/try_again_buttom_widget.dart';

class FavouritePage extends ConsumerWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70), child: MyAppBar()),
      body: StreamBuilder(
        stream: ref.watch(movieProvider.notifier).getFavMoviesFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FavourListWidget(modelData: snapshot.data!);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: TryAgainButtonWidget(
                error: snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
