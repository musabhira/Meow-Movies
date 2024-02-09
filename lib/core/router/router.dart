import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import 'package:meow_films/features/authentication/presentation/page/login_main_page.dart';
import 'package:meow_films/features/authentication/presentation/page/login_page.dart';
import 'package:meow_films/features/authentication/presentation/page/otp_verification.dart';
import 'package:meow_films/features/authentication/presentation/page/phonenumber_verfication_page.dart';
import 'package:meow_films/features/authentication/presentation/page/sign_page.dart';
import 'package:meow_films/features/home_page/Presentation/pages/home_page.dart';
import 'package:meow_films/features/home_page/Presentation/Widgets/bottom_navi_widget.dart';
import 'package:meow_films/features/home_page/Presentation/pages/inHome_page.dart';
import 'package:meow_films/features/home_page/domain/entites/movie_entity.dart';
import 'package:meow_films/features/home_page/domain/entites/review_entity.dart';

final router = GoRouter(initialLocation: bottooomPage.routePath, routes: [
  GoRoute(
      path: bottooomPage.routePath,
      builder: (context, state) => const bottooomPage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified && user.phoneNumber == null) {
          return bottooomPage.routePath;
        }
        return null;
      }),
  GoRoute(
    path: MyMainHome.routePath,
    builder: (context, state) => const MyMainHome(),
  ),
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
            // modelData2: state.extra as List<ReviewEntity>,
          )),
  GoRoute(
    path: PhoneNumber.routePath,
    builder: (context, state) => const PhoneNumber(),
  ),
  GoRoute(
    path: OtpVerification.routePath,
    builder: (context, state) => const OtpVerification(),
  ),
]);
