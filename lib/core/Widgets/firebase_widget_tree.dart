import 'package:flutter/material.dart';
import 'package:meow_films/features/Data/Data%20Source/auth.dart';

import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/Presentation/pages/login_main_page.dart';

import 'package:meow_films/features/Presentation/pages/login_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();

    AuthService.checkAuthStatus().then((user) {
      setState(() {
        isAuthenticated = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuthenticated) {
      return MyHomePage();
    }

    return const MyMainHome();
  }
}
