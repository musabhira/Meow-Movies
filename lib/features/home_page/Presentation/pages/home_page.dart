import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/core/theme/app_theme.dart';

import 'package:meow_films/features/authentication/presentation/page/login_page.dart';
import 'package:meow_films/features/authentication/presentation/providers/auth_provider.dart';

import 'package:meow_films/features/home_page/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/CategoryTitleWidget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/custom_watch.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/tiltle_function.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/try_again_buttom_widget.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/watch_Movies.dart';

const imagePath = 'https://image.tmdb.org/t/p/original';

class MyMainHome extends ConsumerWidget {
  const MyMainHome({
    super.key,
  });
  static const routePath = '/MainHome';
  static const String path = "lib/src/pages/misc/sliders.dart";
  // final imagePath = 'https://image.tmdb.org/t/p/original';
  // 'https://image.tmdb.org/t/p/original';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.textSubtle,
      appBar: AppBar(
        title: Text(
          Constant.meowFilms,
          style: TextStyle(
            color: AppTheme.of(context).colors.textInverse,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: AppTheme.of(context).colors.textInverse,
            ),
            onPressed: () {
              if (FirebaseAuth.instance.currentUser != null) {
                ref.read(authenticationProvider.notifier).signOut(context);
                context.go(MyHomePage.routepath);
              }
            },
          ),
        ],
        flexibleSpace: Container(
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
        ),
      ),
      body: ref.watch(movieProvider).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : switch (ref.watch(movieProvider)) {
              AsyncData(:final value) => SingleChildScrollView(
                  child: Column(
                    children: [
                      CategoryTitleWidget(value: value.trending),
                      title(Constant.currentMovies, context),
                      CustomWatch(
                        value: value.page5,
                      ),
                      title(Constant.beautifulMovies, context),
                      CustomWatch(
                        value: value.page6,
                      ),
                      title(Constant.amazingMovies, context),
                      CustomWatch(
                        value: value.page7,
                      ),
                      WatchMovies(value: value.movies),
                    ],
                  ),
                ),
              AsyncError(:final error, :final stackTrace) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString()),
                    Text(stackTrace.toString()),
                    const TryAgainButtonWidget(
                      error: '',
                    ),
                  ],
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
              // AsyncError(:final error) => Text('Error: $error'),
              // _ => const CircularProgressIndicator(),
            },
    );
  }
}

// class MyHerp extends StatelessWidget {
//   final ApiModel modelData;
//   const MyHerp({
//     super.key,
//     required this.modelData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 32, 31, 31),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 300,
//             color: Colors.black87,
//             child: Image.network("$imagePath${modelData.poster_path}"),
//           )
//         ],
//       ),
//     );
//   }
// }
