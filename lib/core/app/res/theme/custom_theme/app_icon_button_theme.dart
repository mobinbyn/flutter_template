import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppIconButtonTheme implements IAppTheme<IconButtonThemeData> {
  // Singleton instance
  static final AppIconButtonTheme _instance = AppIconButtonTheme._internal();

  // Private constructor to prevent object creation
  AppIconButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppIconButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  IconButtonThemeData get lightTheme => const IconButtonThemeData(
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
  IconButtonThemeData get darkTheme => const IconButtonThemeData(
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

  IconButtonTheme getLightSecondaryIconButtonTheme(Widget child) => IconButtonTheme(
        data: const IconButtonThemeData(
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
