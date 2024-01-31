import 'package:flutter/material.dart';
import 'package:meow_films/features/authentication/presentation/page/login_page.dart';
import 'package:meow_films/features/home_page/Presentation/pages/home_page.dart';

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

    // AuthService.checkAuthStatus().then((user) {
    //   setState(() {
    //     isAuthenticated = user != null;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (!isAuthenticated) {
      return MyHomePage();
    }

    return const MyMainHome();
  }
}
