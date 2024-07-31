import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/app_palettes.dart';
import '../const/app_font.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get lightTextTheme => TextTheme(
        displayLarge: AppTextStyle.getBoldStyle(fontSize: AppFontSize.s16, color: AppPalettes.black),
        displayMedium: AppTextStyle.getRegularStyle(color: AppPalettes.black, fontSize: AppFontSize.s16),
        displaySmall: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        headlineLarge: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        headlineMedium: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        headlineSmall: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        titleLarge: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        titleMedium: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        titleSmall: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        bodyLarge: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        bodyMedium: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        bodySmall: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        labelLarge: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        labelMedium: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
        labelSmall: AppTextStyle.getBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16),
      );

  static TextTheme get darkTextTheme => TextTheme(
        displayLarge: AppTextStyle.getRegularStyle(fontSize: 16, color: Colors.white),
        displayMedium: AppTextStyle.getRegularStyle(fontSize: 14, color: Colors.white),
      );
}

class AppTextStyle {
  static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color? color,
  ) {
    return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);
  }

  /// Thin text style
  static TextStyle getThinStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.thin, color);

  /// Light text style
  static TextStyle getLightStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.light, color);

  /// Regular style
  static TextStyle getRegularStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.regular, color);

  /// Semi bold text style
  static TextStyle getSemiBoldStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.semiBold, color);

  /// Bold text style
  static TextStyle getBoldStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.bold, color);

  /// Extra bold text style
  static TextStyle getExtraBoldStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.extraBold, color);

  /// Black text style
  static TextStyle getBlackStyle({required double fontSize, Color? color}) => _getTextStyle(fontSize, AppFontFamily.fontFamily, AppFontWeight.black, color);
}
