import 'package:flutter/material.dart';

import '../i_app_theme.dart';

class AppIconTheme implements IAppTheme<IconThemeData> {
  // Singleton instance
  static final AppIconTheme _instance = AppIconTheme._internal();

  // Private constructor to prevent object creation
  AppIconTheme._internal();

  // Factory method to return the singleton instance
  factory AppIconTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  IconThemeData get lightTheme => const IconThemeData(
        size: null,
        fill: null,
        weight: null,
        grade: null,
        opticalSize: null,
        color: null,
        opacity: null,
        shadows: null,
        applyTextScaling: null,
      );
  @override
  IconThemeData get darkTheme => const IconThemeData(
        size: null,
        fill: null,
        weight: null,
        grade: null,
        opticalSize: null,
        color: null,
        opacity: null,
        shadows: null,
        applyTextScaling: null,
      );
}
