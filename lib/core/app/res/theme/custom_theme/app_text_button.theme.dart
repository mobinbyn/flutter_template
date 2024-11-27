import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppTextButtonTheme implements IAppTheme<TextButtonThemeData> {
  // Singleton instance
  static final AppTextButtonTheme _instance = AppTextButtonTheme._internal();

  // Private constructor to prevent object creation
  AppTextButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppTextButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  TextButtonThemeData get lightTheme => const TextButtonThemeData(
        style: ButtonStyle(
          textStyle: null,
          backgroundColor: null,
          foregroundColor: null,
          overlayColor: null,
          shadowColor: null,
          surfaceTintColor: null,
          elevation: null,
          padding: null,
          minimumSize: null,
          fixedSize: null,
          maximumSize: null,
          iconColor: null,
          iconSize: null,
          side: null,
          shape: null,
          mouseCursor: null,
          visualDensity: null,
          tapTargetSize: null,
          animationDuration: null,
          enableFeedback: null,
          alignment: null,
          splashFactory: null,
        ),
      );

  @override
  TextButtonThemeData get darkTheme => const TextButtonThemeData(
        style: ButtonStyle(
          textStyle: null,
          backgroundColor: null,
          foregroundColor: null,
          overlayColor: null,
          shadowColor: null,
          surfaceTintColor: null,
          elevation: null,
          padding: null,
          minimumSize: null,
          fixedSize: null,
          maximumSize: null,
          iconColor: null,
          iconSize: null,
          side: null,
          shape: null,
          mouseCursor: null,
          visualDensity: null,
          tapTargetSize: null,
          animationDuration: null,
          enableFeedback: null,
          alignment: null,
          splashFactory: null,
        ),
      );

  TextButtonTheme getLightSecondaryTextButtonTheme(Widget child) => TextButtonTheme(
        data: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: null,
            backgroundColor: null,
            foregroundColor: null,
            overlayColor: null,
            shadowColor: null,
            surfaceTintColor: null,
            elevation: null,
            padding: null,
            minimumSize: null,
            fixedSize: null,
            maximumSize: null,
            iconColor: null,
            iconSize: null,
            side: null,
            shape: null,
            mouseCursor: null,
            visualDensity: null,
            tapTargetSize: null,
            animationDuration: null,
            enableFeedback: null,
            alignment: null,
            splashFactory: null,
          ),
        ),
        child: child,
      );
}
