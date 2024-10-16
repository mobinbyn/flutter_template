import 'package:flutter/material.dart';

import '../i_app_theme.dart';

class AppAppBarTheme implements IAppTheme<AppBarTheme> {
  // Singleton instance
  static final AppAppBarTheme _instance = AppAppBarTheme._internal();

  // Private constructor to prevent object creation
  AppAppBarTheme._internal();

  // Factory method to return the singleton instance
  factory AppAppBarTheme() {
    return _instance;
  }

  // Implementations of the IAppTheme interface
  @override
  AppBarTheme get lightTheme => const AppBarTheme(
        color: null,
        backgroundColor: null,
        foregroundColor: null,
        elevation: null,
        scrolledUnderElevation: null,
        shadowColor: null,
        surfaceTintColor: null,
        shape: null,
        iconTheme: null,
        actionsIconTheme: null,
        centerTitle: null,
        titleSpacing: null,
        toolbarHeight: null,
        toolbarTextStyle: null,
        titleTextStyle: null,
        systemOverlayStyle: null,
      );

  @override
  AppBarTheme get darkTheme => const AppBarTheme(
        color: null,
        backgroundColor: null,
        foregroundColor: null,
        elevation: null,
        scrolledUnderElevation: null,
        shadowColor: null,
        surfaceTintColor: null,
        shape: null,
        iconTheme: null,
        actionsIconTheme: null,
        centerTitle: null,
        titleSpacing: null,
        toolbarHeight: null,
        toolbarTextStyle: null,
        titleTextStyle: null,
        systemOverlayStyle: null,
      );
}
