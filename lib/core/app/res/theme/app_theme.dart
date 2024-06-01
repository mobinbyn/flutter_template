import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/const/app_font.dart';
import 'package:flutter_template/core/app/res/theme/app_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/app_input_theme.dart';
import 'package:flutter_template/core/app/res/theme/app_palettes.dart';
import 'package:flutter_template/core/app/res/theme/app_text_style.dart';

// TODO: The template value
class AppThemes {
  /// Light theme config
  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppPalettes.neutral[99],
      colorScheme: ColorScheme(
        background: AppPalettes.neutral[100]!,
        brightness: Brightness.light,
        primary: AppPalettes.primary,
        onPrimary: AppPalettes.white,
        secondary: AppPalettes.secondary,
        onSecondary: AppPalettes.black,
        error: AppPalettes.tertiary,
        onError: AppPalettes.white,
        onBackground: AppPalettes.black,
        surface: AppPalettes.neutral[100]!,
        onSurface: AppPalettes.black,
      ),

      /// Button theme
      outlinedButtonTheme: AppButtonTheme.primaryOutline,
      filledButtonTheme: AppButtonTheme.primary,
      textButtonTheme: AppButtonTheme.textButton,

      /// Input decoration theme (Text form field)
      inputDecorationTheme: AppInputTheme.textFilledTheme,

      /// Text theme
      textTheme: TextTheme(
        displayLarge: AppTextStyle.getBoldStyle(
            fontSize: AppFontSize.s16, color: AppPalettes.black),
        displayMedium: AppTextStyle.getRegularStyle(
            color: AppPalettes.black, fontSize: AppFontSize.s16),
        displaySmall: AppTextStyle.getBoldStyle(
            color: AppPalettes.primary, fontSize: AppFontSize.s16),
      ),
      fontFamily: AppFontFamily.fontFamily,

      /// Chip Theme
      // chipTheme: ChipThemeData(
      //   backgroundColor: AppPalettes.white,
      //   selectedColor: AppPalettes.white,
      //   labelStyle: AppTextStyle.getRegularStyle(
      //       fontSize: AppFontSize.s14, color: AppPalettes.black),
      //   pressElevation: 0.0,
      //   labelPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      // ),

      // checkboxTheme: CheckboxThemeData(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(4.r),
      //     ),
      //     fillColor: MaterialStateColor.resolveWith(
      //         (states) => AppPalettes.primary[50]!)),
    );
  }

  /// Dark theme config
  ThemeData darkTheme() {
    return ThemeData();
  }
}
