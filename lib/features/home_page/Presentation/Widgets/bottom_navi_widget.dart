import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/app_theme.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:meow_films/features/home_page/Presentation/pages/favourite_page.dart';
import 'package:meow_films/features/home_page/Presentation/pages/home_page.dart';
import 'package:meow_films/features/home_page/Presentation/pages/search_page.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';

class bottooomPage extends StatefulWidget {
  const bottooomPage({super.key});
  static const routePath = '/';
  @override
  State<bottooomPage> createState() => _bottooomState();
}

class _bottooomState extends State<bottooomPage> {
  int selectedIndex = 0;
  final PageController controller = PageController(initialPage: 0);
  late final MovieEntity modelData2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          MyMainHome(),
          SearchPage(),
          // MovieSearchPage(),
          FavouritePage(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: AppTheme.of(context).colors.gradient2,
        height: 50,
        animationDuration: const Duration(milliseconds: 200),
        index: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            controller.jumpToPage(index);
          });
        },
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
