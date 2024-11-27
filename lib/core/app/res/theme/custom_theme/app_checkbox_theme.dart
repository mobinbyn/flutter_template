import 'package:flutter/material.dart';

import '../interface/i_app_theme.dart';

class AppCheckboxTheme implements IAppTheme<CheckboxThemeData> {
  // Singleton instance
  static final AppCheckboxTheme _instance = AppCheckboxTheme._internal();

  // Private constructor to prevent object creation
  AppCheckboxTheme._internal();

  // Factory method to return the singleton instance
  factory AppCheckboxTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  CheckboxThemeData get lightTheme => CheckboxThemeData(
        mouseCursor: null,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {}
          if (states.contains(MaterialState.selected)) {}
        }),
        checkColor: null,
        overlayColor: null,
        splashRadius: null,
        materialTapTargetSize: null,
        visualDensity: null,
        shape: null,
        side: null,
      );

  @override
  CheckboxThemeData get darkTheme => const CheckboxThemeData(
        mouseCursor: null,
        fillColor: null,
        checkColor: null,
        overlayColor: null,
        splashRadius: null,
        materialTapTargetSize: null,
        visualDensity: null,
        shape: null,
        side: null,
      );
}
