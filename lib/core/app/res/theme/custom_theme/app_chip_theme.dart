import 'package:flutter/material.dart';

import '../i_app_theme.dart';

class AppChipTheme implements IAppTheme<ChipThemeData> {
  // Singleton instance
  static final AppChipTheme _instance = AppChipTheme._internal();

  // Private constructor to prevent object creation
  AppChipTheme._internal();

  // Factory method to return the singleton instance
  factory AppChipTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  ChipThemeData get lightTheme => const ChipThemeData(
        color: null,
        backgroundColor: null,
        deleteIconColor: null,
        disabledColor: null,
        selectedColor: null,
        secondarySelectedColor: null,
        shadowColor: null,
        surfaceTintColor: null,
        selectedShadowColor: null,
        showCheckmark: null,
        checkmarkColor: null,
        labelPadding: null,
        padding: null,
        side: null,
        shape: null,
        labelStyle: null,
        secondaryLabelStyle: null,
        brightness: null,
        elevation: null,
        pressElevation: null,
        iconTheme: null,
      );

  @override
  ChipThemeData get darkTheme => const ChipThemeData(
        color: null,
        backgroundColor: null,
        deleteIconColor: null,
        disabledColor: null,
        selectedColor: null,
        secondarySelectedColor: null,
        shadowColor: null,
        surfaceTintColor: null,
        selectedShadowColor: null,
        showCheckmark: null,
        checkmarkColor: null,
        labelPadding: null,
        padding: null,
        side: null,
        shape: null,
        labelStyle: null,
        secondaryLabelStyle: null,
        brightness: null,
        elevation: null,
        pressElevation: null,
        iconTheme: null,
      );
}
