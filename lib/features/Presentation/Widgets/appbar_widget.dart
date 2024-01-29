import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meow_films/core/constant/constant.dart';
import 'package:meow_films/core/theme/app_theme.dart';
import 'package:meow_films/features/Presentation/Providers/auth2_provider.dart';
import 'package:meow_films/features/Presentation/pages/login_page.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppTheme.of(context).colors.textInverse,
        ),
        onPressed: () {
          context.pop(context);
        },
      ),
      title: Text(
        Constant.meowFilms,
        style: TextStyle(
          color: AppTheme.of(context).colors.textInverse,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 10,
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: AppTheme.of(context).colors.textInverse,
          ),
          onPressed: () {
            if (FirebaseAuth.instance.currentUser != null) {
              ref.read(authenticationProvider(context).notifier).signOut();
              context.go(MyHomePage.routepath);
            }
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colors.gradient1,
              theme.colors.gradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
