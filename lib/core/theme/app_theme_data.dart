import 'package:edusphere_mobile/core/constants/app_colorscheme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    colorScheme: AppColorscheme().lightColors,
  );

  ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    colorScheme: AppColorscheme().darkColors,
  );
}
