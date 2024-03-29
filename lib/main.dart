import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meow_films/core/objectbox/movie_objectbox.dart';

import 'package:meow_films/core/router/router.dart';
import 'package:meow_films/core/theme/light_theme.dart';

import 'package:meow_films/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MovieStoreObjectBox.createMethod();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ref.watch(lightThemeProvider),
    );
  }
}
