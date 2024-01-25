import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/constant/constant.dart';

import 'package:meow_films/features/Presentation/Providers/auth2_provider.dart';
import 'package:meow_films/features/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/Presentation/Widgets/try_again_buttom_widget.dart';
import 'package:meow_films/features/Presentation/pages/inHome_page.dart';

import 'package:meow_films/features/Presentation/pages/login_page.dart';

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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 157, 157),
      appBar: AppBar(
        title: const Text(
          Constant.meowFilms,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 12, 1, 31),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              if (FirebaseAuth.instance.currentUser != null) {
                ref.read(authenticationProvider(context).notifier).signOut();
                context.go(MyHomePage.routepath);
              }
            },
          ),
        ],
      ),
      body: switch (ref.watch(movieProvider)) {
        AsyncData(:final value) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      color: const Color.fromARGB(255, 199, 203, 204),
                      child: CarouselSlider.builder(
                        itemCount: value.trending.length,
                        options: CarouselOptions(
                          // height: 400,
                          // autoPlay: true,
                          // autoPlayInterval: Duration(seconds: 4),
                          // autoPlayAnimationDuration:
                          //     Duration(milliseconds: 800),
                          // enableInfiniteScroll: true,
                          height: 500,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.7,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: InkWell(
                                onTap: () {
                                  context.push(MyHerp.routePath,
                                      extra: value.trending[index]);
                                },
                                child: Container(
                                  height: 100,
                                  color: const Color.fromARGB(255, 12, 1, 31),
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          '$imagePath${value.trending[index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: Center(
                                          child: Text(
                                            value.trending[index].title,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 700,
                      color: const Color.fromARGB(255, 199, 203, 204),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // Number of columns
                          crossAxisSpacing: 0.0, // Spacing between columns
                          mainAxisSpacing: 0.0, // Spacing between rows
                        ),
                        itemCount: value.movies.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  context.push(MyHerp.routePath,
                                      extra: value.movies[index]);
                                },
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: 300,
                                    width: 200,
                                    color: const Color.fromARGB(255, 12, 1, 31),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          height: 200,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              '$imagePath${value.movies[index].posterPath}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Center(
                                            child: Text(
                                              value.movies[index].title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        AsyncError() => const TryAgainButtonWidget(),
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
