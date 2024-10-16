import 'package:flutter/material.dart';

import '../i_app_theme.dart';

class AppElevatedButtonTheme implements IAppTheme<ElevatedButtonThemeData> {
  // Singleton instance
  static final AppElevatedButtonTheme _instance = AppElevatedButtonTheme._internal();

  // Private constructor to prevent object creation
  AppElevatedButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppElevatedButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  ElevatedButtonThemeData get lightTheme => const ElevatedButtonThemeData(
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
  ElevatedButtonThemeData get darkTheme => const ElevatedButtonThemeData(
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

  ElevatedButtonTheme getLightSecondaryElevatedButtonTheme(Widget child) => ElevatedButtonTheme(
        data: const ElevatedButtonThemeData(
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
