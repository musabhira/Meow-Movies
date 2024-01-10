import 'package:flutter/material.dart';
import 'package:meow_films/features/Presentation/Widgets/logOut_button_widget.dart';

class MyMainHome extends StatefulWidget {
  const MyMainHome({super.key});

  @override
  State<MyMainHome> createState() => _MyMainHomeState();
}

class _MyMainHomeState extends State<MyMainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyLogOutButton(),
      ),
    );
  }
}
