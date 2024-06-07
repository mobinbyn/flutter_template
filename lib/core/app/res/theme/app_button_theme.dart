import 'package:flutter/material.dart';
import '../const/app_dimens.dart';
import '../const/app_font.dart';
import 'app_palettes.dart';
import 'app_text_style.dart';

// TODO: The template value
class AppButtonTheme {
  ///*********************************************** */
  ///*              Filled Button Theme              */
  ///*********************************************** */
  /// Filled button with primary color
  static FilledButtonThemeData primary = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      // Text color in active mode
      foregroundColor: AppPalettes.neutral[100],
      // Box color in active mode
      backgroundColor: AppPalettes.primary,
      // Text color in deactive mode
      disabledForegroundColor: AppPalettes.neutral[100],
      // Box color in deactive mode
      disabledBackgroundColor: AppPalettes.primary[90],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      padding: AppPadding.button,
      elevation: 0.0,
      textStyle: AppTextStyle.getBoldStyle(
        fontSize: AppFontSize.s16,
        color: AppPalettes.neutral[100]!,
      ),
    ),
  );

  /// Filled button with secondary color
  static ButtonStyle secondary = FilledButton.styleFrom(
    // Text color in active mode
    foregroundColor: AppPalettes.black,
    // Box color in active mode
    backgroundColor: AppPalettes.secondary[70],
    // Text color in deactive mode
    disabledForegroundColor: AppPalettes.neutral[60],
    // Box color in deactive mode
    disabledBackgroundColor: AppPalettes.secondary[95],
  );

  ///*********************************************** */
  ///*              Elevated Button Theme            */
  ///*********************************************** */
  /// Filled button with tertiary color
  static ButtonStyle tertiary = ElevatedButton.styleFrom(
    // Text color in active mode
    foregroundColor: AppPalettes.white,
    // Box color in active mode
    backgroundColor: AppPalettes.tertiary[30],
    // Text color in deactive mode
    disabledForegroundColor: AppPalettes.white,
    // Box color in deactive mode
    disabledBackgroundColor: AppPalettes.tertiary[90],
  );

  /// Filled button with light yellow color
  static ButtonStyle lightYellow = ElevatedButton.styleFrom(
    // Text color in active mode
    foregroundColor: AppPalettes.black,
    // Box color in active mode
    backgroundColor: AppPalettes.lightYellow,
    // Text color in deactive mode
    disabledForegroundColor: AppPalettes.neutral[60],
    // Box color in deactive mode
    disabledBackgroundColor: AppPalettes.white,
  );

  // TODO copy this part into outlinebutton widget
  // static BorderSide primaryBorderSide() {
  //   return MaterialStateProperty.resolveWith<BorderSide>(
  //     (Set<MaterialState> states) => BorderSide(
  //       width: 1,
  //       color: states.contains(MaterialState.disabled)
  //           ? AppPalettes.primary[95]!
  //           : AppPalettes.primary,
  //     ),
  //   ) as BorderSide;
  // }

  ///*********************************************** */
  ///*              Outlined Button Theme            */
  ///*********************************************** */
  /// Outline button wiht primary color
  static OutlinedButtonThemeData primaryOutline = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // Text color in active mode
      foregroundColor: AppPalettes.primary,
      // Box color in active mode
      backgroundColor: AppPalettes.neutral[100],
      // Text color in deactive mode
      disabledForegroundColor: AppPalettes.primary[95],
      // Box color in deactive mode
      disabledBackgroundColor: AppPalettes.neutral[100],
      side: const BorderSide(
        width: 1,
        // TODO borerSide primary[95] for disable mode
        color: AppPalettes.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      padding: AppPadding.button,
      elevation: 0.0,
      textStyle: AppTextStyle.getBoldStyle(
        fontSize: AppFontSize.s16,
      ),
    ),
  );

  /// Outline button wiht neutral color
  static ButtonStyle neutralOutline = OutlinedButton.styleFrom(
    // Text color in active mode
    foregroundColor: AppPalettes.black,
    // Box color in active mode
    backgroundColor: AppPalettes.neutral[100],
    // Text color in deactive mode
    disabledForegroundColor: AppPalettes.neutral[70],
    // Box color in deactive mode
    disabledBackgroundColor: AppPalettes.neutral[100],
    // TODO borerSide neutral[80] for disable mode
    side: BorderSide(color: AppPalettes.neutral[40]!, width: 1),
  );

  ///*********************************************** */
  ///*               Text Button Theme               */
  ///*********************************************** */
  /// Text button theme
  static TextButtonThemeData textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      // Text color in active mode
      foregroundColor: AppPalettes.black,
      // Box color in active mode
      backgroundColor: AppPalettes.neutral[100],
      // Text color in deactive mode
      disabledForegroundColor: AppPalettes.neutral[80],
      // Box color in deactive mode
      disabledBackgroundColor: AppPalettes.neutral[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
      padding: AppPadding.button,
      elevation: 0.0,
      textStyle: AppTextStyle.getBoldStyle(
        fontSize: AppFontSize.s16,
      ),
    ),
  );
}
