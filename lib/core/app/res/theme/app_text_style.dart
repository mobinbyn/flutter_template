import 'package:flutter/material.dart';
import '../const/app_font.dart';

class AppTextStyle {
  static TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color? color,
  ) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight);
  }

  /// Thin text style
  static TextStyle getThinStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.thin, color);

  /// Light text style
  static TextStyle getLightStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.light, color);

  /// Regular style
  static TextStyle getRegularStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.regular, color);

  /// Semi bold text style
  static TextStyle getSemiBoldStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.semiBold, color);

  /// Bold text style
  static TextStyle getBoldStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.bold, color);

  /// Extra bold text style
  static TextStyle getExtraBoldStyle(
          {required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.extraBold, color);

  /// Black text style
  static TextStyle getBlackStyle({required double fontSize, Color? color}) =>
      _getTextStyle(
          fontSize, AppFontFamily.fontFamily, AppFontWeight.black, color);
}
