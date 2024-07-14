import 'package:flutter/material.dart';
import '../const/app_font.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';
import 'app_palettes.dart';
import 'app_text_style.dart';

// TODO: The template value
class AppThemes {
  /// Light theme config
  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
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
      buttonTheme: ButtonThemeData(),
      outlinedButtonTheme: AppButtonTheme.primaryOutline,
      filledButtonTheme: AppButtonTheme.primary,
      textButtonTheme: AppButtonTheme.textButton,
      iconButtonTheme: IconButtonThemeData(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),

      /// Input decoration theme (Text form field)
      inputDecorationTheme: AppInputTheme.textFilledTheme,

      /// Text theme
      textTheme: TextTheme(
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
      ),
      fontFamily: AppFontFamily.fontFamily,

      iconTheme: IconThemeData(color: AppPalettes.primary),
      actionIconTheme: ActionIconThemeData(),
      appBarTheme: AppBarTheme(),
      badgeTheme: BadgeThemeData(),
      bannerTheme: MaterialBannerThemeData(),
      bottomAppBarTheme: BottomAppBarTheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(),
      bottomSheetTheme: BottomSheetThemeData(),
      toggleButtonsTheme: ToggleButtonsThemeData(),
      chipTheme: ChipThemeData(),
      checkboxTheme: CheckboxThemeData(),
      cardTheme: CardTheme(),
      dialogTheme: DialogTheme(),
      datePickerTheme: DatePickerThemeData(),
      dividerTheme: DividerThemeData(),
      drawerTheme: DrawerThemeData(),
      dropdownMenuTheme: DropdownMenuThemeData(),

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
