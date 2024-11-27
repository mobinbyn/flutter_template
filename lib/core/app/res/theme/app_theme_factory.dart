import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/app_dark_theme.dart';
import 'package:flutter_template/core/app/res/theme/app_light_theme.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';

class AppThemeFactory {
  IAppThemeStrategy<ThemeData> createTheme(String type) {
    switch (type) {
      case 'light':
        return AppLightTheme();
      case 'dark':
        return AppDarkTheme();
      default:
        throw Exception('Theme type $type not supported');
    }
  }
}
