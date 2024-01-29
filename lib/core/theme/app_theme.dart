import 'package:flutter/material.dart';
import 'package:meow_films/core/theme/extenion/color_extension.dart';
import 'package:meow_films/core/theme/extenion/space_extension.dart';
import 'package:meow_films/core/theme/extenion/typography_extension.dart';

final class AppTheme {
  final BuildContext context;

  AppTheme.of(this.context);

  AppColorExtension get colors {
    return Theme.of(context).extension<AppColorExtension>()!;
  }

  AppSpaceExtension get spaces {
    return Theme.of(context).extension<AppSpaceExtension>()!;
  }

  AppTypographyExtension get typography {
    return Theme.of(context).extension<AppTypographyExtension>()!;
  }
}
