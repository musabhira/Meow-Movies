import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meow_films/features/Presentation/Widgets/youtube_widget.dart';

import 'package:meow_films/features/domain/entites/movie_entity.dart';

const imagePath = 'https://image.tmdb.org/t/p/original';

class MyHerp extends StatelessWidget {
  final MovieEntity modelData1;
  const MyHerp({super.key, required this.modelData1});
  static const routePath = '/myHerp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 62, 63),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 800,
                  color: const Color.fromARGB(255, 12, 1, 31),
                  child: SingleChildScrollView(
                    child: Column(
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
                                      "$imagePath${modelData1.posterPath}"))),
                        ),
                        Text(
                          modelData1.title,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            modelData1.originalTitle,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 161, 160, 160),
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 350,
                          child: Text(
                            modelData1.overview,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: YoutubePlayerWidget(modelData1: modelData1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
