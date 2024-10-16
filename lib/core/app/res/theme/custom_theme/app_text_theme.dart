import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/const/app_font.dart';
import 'package:flutter_template/core/app/res/theme/app_text_style.dart';

class AppTextTheme {
  AppTextTheme._();

  /// Light Text Theme
  static TextTheme get lightTextTheme => TextTheme(
        /// Display
        displayLarge: AppTextStyle.getLightStyle(fontSize: AppFontSize.s96), // letter spacing -1.5
        displayMedium: AppTextStyle.getLightStyle(fontSize: AppFontSize.s60), // letter spacing -0.5
        displaySmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s48), // letter spacing 0.

        /// Headline
        headlineLarge: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s40), // letter spacing 0.25
        headlineMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s34), // letter spacing 0.25
        headlineSmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s24), // letter spacing 0

        /// Title
        titleLarge: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s20), // letter spacing 0.15
        titleMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16), // letter spacing 0.15
        titleSmall: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s14), // letter spacing 0.1

        /// Label
        labelLarge: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s14), // letter spacing 1.25
        labelMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s11), // letter spacing 1.5
        labelSmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s10), // letter spacing 1.5

        /// Body
        bodyLarge: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16), // letter spacing 0.5
        bodyMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s14), // letter spacing 0.25
        bodySmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s12), // letter spacing 0.4
      );

  /// Dark Text Theme
  static TextTheme get darkTextTheme => TextTheme(
        /// Display
        displayLarge: AppTextStyle.getLightStyle(fontSize: AppFontSize.s96), // letter spacing -1.5
        displayMedium: AppTextStyle.getLightStyle(fontSize: AppFontSize.s60), // letter spacing -0.5
        displaySmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s48), // letter spacing 0.

        /// Headline
        headlineLarge: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s40), // letter spacing 0.25
        headlineMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s34), // letter spacing 0.25
        headlineSmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s24), // letter spacing 0

        /// Title
        titleLarge: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s20), // letter spacing 0.15
        titleMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16), // letter spacing 0.15
        titleSmall: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s14), // letter spacing 0.1

        /// Label
        labelLarge: AppTextStyle.getMediumStyle(fontSize: AppFontSize.s14), // letter spacing 1.25
        labelMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s11), // letter spacing 1.5
        labelSmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s10), // letter spacing 1.5

        /// Body
        bodyLarge: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s16), // letter spacing 0.5
        bodyMedium: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s14), // letter spacing 0.25
        bodySmall: AppTextStyle.getRegularStyle(fontSize: AppFontSize.s12), // letter spacing 0.4
      );
}
