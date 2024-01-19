import 'package:flutter/material.dart';
import 'package:meow_films/features/Data/Models/api_model.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

class MyHerp extends StatefulWidget {
  final Result modelData1;
  const MyHerp(
      {super.key, required this.modelData1, required MovieEntity modelData});
  static const routePath = '/myHerp';

  @override
  State<MyHerp> createState() => _MyHerpState();
}

class _MyHerpState extends State<MyHerp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 31, 31),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.black87,
            child: Image.network("$imagePath${widget.modelData1.posterPath}"),
          )
        ],
      ),
    );
  }
}
