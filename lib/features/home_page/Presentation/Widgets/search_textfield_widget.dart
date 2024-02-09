import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/app_theme.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const SearchTextFieldWidget(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return TextField(
      controller: controller,
      style: appTheme.typography.h200,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(appTheme.spaces.space_100),
        hintText: text,
        hintStyle: appTheme.typography.pDefault
            .copyWith(color: appTheme.colors.textSubtle.withOpacity(0.7)),
        prefixIcon: Icon(Icons.search,
            color: appTheme.colors.textSubtle.withOpacity(0.7)),
        filled: true,
        fillColor: appTheme.colors.textSubtle.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(appTheme.spaces.space_200),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(appTheme.spaces.space_200),
          borderSide: BorderSide(color: appTheme.colors.primary, width: 2.0),
        ),
      ),
    );
  }
}
