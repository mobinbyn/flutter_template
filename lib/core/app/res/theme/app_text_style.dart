import 'package:flutter/material.dart';
import '../const/app_font.dart';

class AppTextStyle {
  static TextStyle _getTextStyle({
    required double fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? color,
    double? spacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      wordSpacing: spacing,
      height: height,
    );
  }

  /// Thin text style
  static TextStyle getThinStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.thin,
        color: color,
        height: height,
      );

  /// ExtraThin text style
  static TextStyle getExtraThinStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.extraThin,
        color: color,
        height: height,
      );

  /// Light text style
  static TextStyle getLightStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.light,
        color: color,
        height: height,
      );

  /// Regular style
  static TextStyle getRegularStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.regular,
        color: color,
        height: height,
      );

  /// Medium style
  static TextStyle getMediumStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.medium,
        color: color,
        height: height,
      );

  /// Semi bold text style
  static TextStyle getSemiBoldStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.semiBold,
        color: color,
        height: height,
      );

  /// Bold text style
  static TextStyle getBoldStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.bold,
        color: color,
        height: height,
      );

  /// Extra bold text style
  static TextStyle getExtraBoldStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.extraBold,
        color: color,
        height: height,
      );

  /// Black text style
  static TextStyle getBlackStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    double? spacing,
    double? height,
  }) =>
      _getTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? AppFontFamily.fontFamily,
        fontWeight: AppFontWeight.black,
        color: color,
        height: height,
      );
}
