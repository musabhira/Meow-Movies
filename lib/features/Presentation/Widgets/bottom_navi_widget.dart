import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/Presentation/Providers/movie_api_provider.dart';
import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/Presentation/pages/inHome_page.dart';
import 'package:meow_films/features/Presentation/pages/search_page.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          MyMainHome(),
          MovieSearchPage(),
          // MovieSearchPage(),
          Scaffold(),
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
          Icon(Icons.notifications, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
