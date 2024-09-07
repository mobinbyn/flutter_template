import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/app_palettes.dart';
import '../const/app_font.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get lightTextTheme => TextTheme(
        displayLarge: AppTextStyle.getRegularStyle(color: AppPalettes.black, fontSize: AppFontSize.s57, spacing: -0.25, height: 64),
        displayMedium: AppTextStyle.getRegularStyle(color: AppPalettes.black, fontSize: AppFontSize.s45, spacing: 0, height: 52),
        displaySmall: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s36, spacing: 0.0, height: 44),
        headlineLarge: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s32, spacing: 0.0, height: 40),
        headlineMedium: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s28, spacing: 0.0, height: 36),
        headlineSmall: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s24, spacing: 0.0, height: 32),
        titleLarge: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s22, spacing: 0.0, height: 28),
        titleMedium: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16, spacing: 0.15, height: 24),
        titleSmall: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s14, spacing: 0.1, height: 20),
        labelLarge: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s14, spacing: 0.1, height: 20),
        labelMedium: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s12, spacing: 0.5, height: 16),
        labelSmall: AppTextStyle.getSemiBoldStyle(color: AppPalettes.primary, fontSize: AppFontSize.s11, spacing: 0.5, height: 16),
        bodyLarge: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s16, spacing: 0.5, height: 24),
        bodyMedium: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s14, spacing: 0.25, height: 20),
        bodySmall: AppTextStyle.getRegularStyle(color: AppPalettes.primary, fontSize: AppFontSize.s12, spacing: 0.4, height: 16),
      );

  static TextTheme get darkTextTheme => TextTheme(
        displayLarge: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s57, spacing: -1.5),
        displayMedium: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s45, spacing: -0.5),
        displaySmall: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s36, spacing: 0.0),
        headlineLarge: AppTextStyle.getBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s32, spacing: 0.25),
        headlineMedium: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s28, spacing: 0.0),
        headlineSmall: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s24, spacing: 1.5),
        titleLarge: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s22, spacing: 0.0),
        titleMedium: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s16, spacing: 0.15),
        titleSmall: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s14, spacing: 0.1),
        labelLarge: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s14, spacing: 0.1),
        labelMedium: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s12, spacing: 0.5),
        labelSmall: AppTextStyle.getSemiBoldStyle(color: AppPalettes.white, fontSize: AppFontSize.s11, spacing: 0.5),
        bodyLarge: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s16, spacing: 0.15),
        bodyMedium: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s14, spacing: 0.25),
        bodySmall: AppTextStyle.getRegularStyle(color: AppPalettes.white, fontSize: AppFontSize.s12, spacing: 0.4),
      );
}

class AppTextStyle {
  static TextStyle _getTextStyle({
    required double fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? color,
    double? spacing,
    double? height,
  }) {
    return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight, wordSpacing: spacing, height: height);
  }

  /// Thin text style
  static TextStyle getThinStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.thin, color: color, height: height);

  /// Light text style
  static TextStyle getLightStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.light, color: color, height: height);

  /// Regular style
  static TextStyle getRegularStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.regular, color: color, height: height);

  /// Semi bold text style
  static TextStyle getSemiBoldStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.semiBold, color: color, height: height);

  /// Bold text style
  static TextStyle getBoldStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.bold, color: color, height: height);

  /// Extra bold text style
  static TextStyle getExtraBoldStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.extraBold, color: color, height: height);

  /// Black text style
  static TextStyle getBlackStyle({required double fontSize, Color? color, double? spacing, double? height}) => _getTextStyle(fontSize: fontSize, fontFamily: AppFontFamily.fontFamily, fontWeight: AppFontWeight.black, color: color, height: height);
}
