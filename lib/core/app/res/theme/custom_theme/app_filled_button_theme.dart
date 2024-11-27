import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppFilledButtonTheme implements IAppTheme<FilledButtonThemeData> {
  // Singleton instance
  static final AppFilledButtonTheme _instance = AppFilledButtonTheme._internal();

  // Private constructor to prevent object creation
  AppFilledButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppFilledButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  FilledButtonThemeData get lightTheme => const FilledButtonThemeData(
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
  FilledButtonThemeData get darkTheme => const FilledButtonThemeData(
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

  FilledButtonTheme getLightSecondaryFilledButtonTheme(Widget child) => FilledButtonTheme(
        data: const FilledButtonThemeData(
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
