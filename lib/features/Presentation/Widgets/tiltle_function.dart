import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/app_theme.dart';

Widget title(String text, BuildContext context) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppTheme.of(context).colors.gradient1,
          AppTheme.of(context).colors.gradient2,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Text('$text', style: AppTheme.of(context).typography.h600),
  );
}
