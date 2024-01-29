import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/color_theme.dart';
import 'package:meow_films/core/theme/extenion/color_extension.dart';
import 'package:meow_films/core/theme/extenion/space_extension.dart';
import 'package:meow_films/core/theme/extenion/typography_extension.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
        primary: Colors.yellow,
        secondary: AppColorPalette.yellow100,
        text: AppColorPalette.grey900,
        textInverse: Colors.white,
        textSubtle: AppColorPalette.grey700,
        textSubtlest: AppColorPalette.grey500,
        backgroundDanger: Colors.blue,
        myColor: Colors.black,
        appBar: AppColorPalette.darkblue,
        gradient1: Colors.blue,
        gradient2: Colors.purple),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
        defaultFontColor: AppColorPalette.grey900,
        linkColor: Colors.blue,
        dimFontColor: AppColorPalette.grey700,
        whiteColor: Colors.white)
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
