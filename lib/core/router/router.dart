import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/features/Presentation/Widgets/bottom_navi_widget.dart';

import 'package:meow_films/features/Presentation/pages/home_page.dart';
import 'package:meow_films/features/Presentation/pages/inHome_page.dart';

import 'package:meow_films/features/Presentation/pages/login_main_page.dart';
import 'package:meow_films/features/Presentation/pages/login_page.dart';
import 'package:meow_films/features/Presentation/pages/sign_page.dart';
import 'package:meow_films/features/domain/entites/movie_entity.dart';

final router = GoRouter(initialLocation: bottooomPage.routePath, routes: [
  GoRoute(
      path: bottooomPage.routePath,
      builder: (context, state) => const bottooomPage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified) {
          return MyHomePage.routepath;
        }
        return null;
      }),
  GoRoute(
    path: MyLoggingPage.routepath,
    builder: (context, state) => MyLoggingPage(),
  ),
  GoRoute(path: Mysignup.routepath, builder: (context, state) => Mysignup()),
  GoRoute(
    path: MyHomePage.routepath,
    builder: (context, state) => const MyHomePage(),
  ),
  GoRoute(
      path: MyHerp.routePath,
      builder: (context, state) => MyHerp(
            modelData1: state.extra as MovieEntity,
          ))
]);
