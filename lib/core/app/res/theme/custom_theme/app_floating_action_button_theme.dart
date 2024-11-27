import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppFloatingActionButtonTheme implements IAppTheme<FloatingActionButtonThemeData> {
  // Singleton instance
  static final AppFloatingActionButtonTheme _instance = AppFloatingActionButtonTheme._internal();

  // Private constructor to prevent object creation
  AppFloatingActionButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppFloatingActionButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  FloatingActionButtonThemeData get lightTheme => const FloatingActionButtonThemeData(
        foregroundColor: null,
        backgroundColor: null,
        focusColor: null,
        hoverColor: null,
        splashColor: null,
        elevation: null,
        focusElevation: null,
        hoverElevation: null,
        disabledElevation: null,
        highlightElevation: null,
        shape: null,
        enableFeedback: null,
        iconSize: null,
        sizeConstraints: null,
        smallSizeConstraints: null,
        largeSizeConstraints: null,
        extendedSizeConstraints: null,
        extendedIconLabelSpacing: null,
        extendedPadding: null,
        extendedTextStyle: null,
        mouseCursor: null,
      );

  @override
  FloatingActionButtonThemeData get darkTheme => const FloatingActionButtonThemeData(
        foregroundColor: null,
        backgroundColor: null,
        focusColor: null,
        hoverColor: null,
        splashColor: null,
        elevation: null,
        focusElevation: null,
        hoverElevation: null,
        disabledElevation: null,
        highlightElevation: null,
        shape: null,
        enableFeedback: null,
        iconSize: null,
        sizeConstraints: null,
        smallSizeConstraints: null,
        largeSizeConstraints: null,
        extendedSizeConstraints: null,
        extendedIconLabelSpacing: null,
        extendedPadding: null,
        extendedTextStyle: null,
        mouseCursor: null,
      );
}
