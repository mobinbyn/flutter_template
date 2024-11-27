import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppOutlinedButtonTheme implements IAppTheme<OutlinedButtonThemeData> {
  // Singleton instance
  static final AppOutlinedButtonTheme _instance = AppOutlinedButtonTheme._internal();

  // Private constructor to prevent object creation
  AppOutlinedButtonTheme._internal();

  // Factory method to return the singleton instance
  factory AppOutlinedButtonTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  OutlinedButtonThemeData? get lightTheme => const OutlinedButtonThemeData(
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
  OutlinedButtonThemeData? get darkTheme => const OutlinedButtonThemeData(
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

  ///
  ///      ______      _               _   _
  ///     |  ____|    | |             | | | |
  ///     | |__  __  _| |_ _ __ __ _  | |_| |__   ___ _ __ ___   ___
  ///     |  __| \ \/ / __| '__/ _` | | __| '_ \ / _ \ '_ ` _ \ / _ \
  ///     | |____ >  <| |_| | | (_| | | |_| | | |  __/ | | | | |  __/
  ///     |______/_/\_\\__|_|  \__,_|  \__|_| |_|\___|_| |_| |_|\___|
  ///

  OutlinedButtonTheme getLightSecondaryOutlinedButtonTheme(Widget child) => OutlinedButtonTheme(
        data: const OutlinedButtonThemeData(
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
