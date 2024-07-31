import 'package:flutter/material.dart';
import '../const/app_font.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';
import 'app_palettes.dart';
import 'app_text_style.dart';

// TODO: The template value
class AppThemes {
  AppThemes._();

  /// Light theme config
  static ThemeData get lightTheme => ThemeData(
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
        textTheme: AppTextTheme.lightTextTheme,
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

  /// Dark theme config
  static ThemeData get darkTheme => ThemeData();
}
