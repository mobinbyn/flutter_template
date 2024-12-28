import 'package:flutter/material.dart';

/// Extension methods for [BuildContext] to create [Theme] objects.
extension ThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get disabledColor => Theme.of(this).disabledColor;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
