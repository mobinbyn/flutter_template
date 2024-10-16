import 'package:flutter/material.dart';

import '../const/app_dimens.dart';
import '../const/app_font.dart';
import 'app_color_scheme.dart';
import 'custom_theme/app_appbar_theme.dart';
import 'custom_theme/app_checkbox_theme.dart';
import 'custom_theme/app_chip_theme.dart';
import 'custom_theme/app_elevated_button_theme.dart';
import 'custom_theme/app_filled_button_theme.dart';
import 'custom_theme/app_floating_action_button_theme.dart';
import 'custom_theme/app_icon_button_theme.dart';
import 'custom_theme/app_icon_theme.dart';
import 'custom_theme/app_input_theme.dart';
import 'custom_theme/app_outlined_button_theme.dart';
import 'custom_theme/app_text_button.theme.dart';
import 'custom_theme/app_text_theme.dart';
import 'i_app_theme.dart';

// The AppThemes class is used to manage theme configurations for the app
class AppThemes implements IAppTheme<ThemeData> {
  // Singleton instance
  static final AppThemes _instance = AppThemes._internal();

  // Private constructor to prevent object creation
  AppThemes._internal();

  // Factory method to return the singleton instance
  factory AppThemes() {
    return _instance;
  }

  /// Light theme configuration
  /// This sets up the light theme for the app using various customized elements
  @override
  ThemeData get lightTheme => ThemeData(
        useMaterial3: true, // Enables Material Design 3 components
        brightness: Brightness.light, // Defines the overall theme brightness as light
        // scaffoldBackgroundColor: AppPalettes.neutral[99], // Sets the background color for Scaffold
        colorScheme: AppColorScheme.lightColorScheme, // Sets the color scheme for the app

        /// Button themes
        buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.button),
        )), // General button theme (legacy)
        outlinedButtonTheme: AppOutlinedButtonTheme().lightTheme, // Theme for outlined buttons
        filledButtonTheme: AppFilledButtonTheme().lightTheme, // Theme for filled buttons
        elevatedButtonTheme: AppElevatedButtonTheme().lightTheme, // Theme for elevated buttons
        textButtonTheme: AppTextButtonTheme().lightTheme, // Theme for text buttons
        iconButtonTheme: AppIconButtonTheme().lightTheme, // Theme for icon buttons
        floatingActionButtonTheme: AppFloatingActionButtonTheme().lightTheme, // Theme for FAB

        /// Input decoration theme (Text form fields)
        inputDecorationTheme: AppInputTheme().lightTheme, // Custom input field styling

        /// Text theme
        textTheme: AppTextTheme.lightTextTheme, // Custom text styles for light theme
        fontFamily: AppFontFamily.yekanBackh, // Custom font family

        /// Icon theme
        iconTheme: AppIconTheme().lightTheme, // Icon color
        actionIconTheme: ActionIconThemeData(), // Custom action icon theme
        appBarTheme: AppAppBarTheme().lightTheme, // Custom AppBar theme
        badgeTheme: BadgeThemeData(), // Custom Badge theme
        bannerTheme: MaterialBannerThemeData(), // Custom Banner theme
        bottomAppBarTheme: BottomAppBarTheme(), // Custom BottomAppBar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(), // Custom BottomNavigationBar theme
        bottomSheetTheme: BottomSheetThemeData(), // Custom BottomSheet theme
        toggleButtonsTheme: ToggleButtonsThemeData(), // Custom ToggleButtons theme
        checkboxTheme: AppCheckboxTheme().lightTheme, // Custom Checkbox theme
        chipTheme: AppChipTheme().lightTheme, // Custom Chip theme
        cardTheme: CardTheme(), // Custom Card theme
        dialogTheme: DialogTheme(), // Custom Dialog theme
        datePickerTheme: DatePickerThemeData(), // Custom DatePicker theme
        dividerTheme: DividerThemeData(), // Custom Divider theme
        drawerTheme: DrawerThemeData(), // Custom Drawer theme
        dropdownMenuTheme: DropdownMenuThemeData(), // Custom DropdownMenu theme
        radioTheme: null,
        sliderTheme: null,
        snackBarTheme: null,
        timePickerTheme: null,
        switchTheme: null,
        menuTheme: null,
        progressIndicatorTheme: null,
        expansionTileTheme: null,
        popupMenuTheme: null,
        tabBarTheme: null,
        menuBarTheme: null,
        navigationBarTheme: null,
        listTileTheme: null,
      );

  /// Dark theme configuration (currently not defined)
  @override
  ThemeData get darkTheme => ThemeData(
        useMaterial3: true, // Enables Material Design 3 components
        brightness: Brightness.dark, // Defines the overall theme brightness as light
        // scaffoldBackgroundColor: AppPalettes.neutral[99], // Sets the background color for Scaffold
        colorScheme: AppColorScheme.darkColorScheme, // Sets the color scheme for the app

        /// Button themes
        buttonTheme: ButtonThemeData(), // General button theme (legacy)
        outlinedButtonTheme: AppOutlinedButtonTheme().darkTheme, // Theme for outlined buttons
        filledButtonTheme: AppFilledButtonTheme().darkTheme, // Theme for filled buttons
        elevatedButtonTheme: AppElevatedButtonTheme().darkTheme, // Theme for elevated buttons
        textButtonTheme: AppTextButtonTheme().darkTheme, // Theme for text buttons
        iconButtonTheme: AppIconButtonTheme().darkTheme, // Theme for icon buttons
        floatingActionButtonTheme: AppFloatingActionButtonTheme().darkTheme, // Theme for FAB

        /// Input decoration theme (Text form fields)
        inputDecorationTheme: AppInputTheme().darkTheme, // Custom input field styling

        /// Text theme
        textTheme: AppTextTheme.darkTextTheme, // Custom text styles for light theme
        fontFamily: AppFontFamily.fontFamily, // Custom font family

        /// Icon theme
        iconTheme: AppIconTheme().darkTheme, // Icon color
        actionIconTheme: ActionIconThemeData(), // Custom action icon theme
        appBarTheme: AppAppBarTheme().darkTheme, // Custom AppBar theme
        badgeTheme: BadgeThemeData(), // Custom Badge theme
        bannerTheme: MaterialBannerThemeData(), // Custom Banner theme
        bottomAppBarTheme: BottomAppBarTheme(), // Custom BottomAppBar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(), // Custom BottomNavigationBar theme
        bottomSheetTheme: BottomSheetThemeData(), // Custom BottomSheet theme
        toggleButtonsTheme: ToggleButtonsThemeData(), // Custom ToggleButtons theme
        checkboxTheme: AppCheckboxTheme().darkTheme, // Custom Checkbox theme
        chipTheme: AppChipTheme().darkTheme, // Custom Chip theme
        cardTheme: CardTheme(), // Custom Card theme
        dialogTheme: DialogTheme(), // Custom Dialog theme
        datePickerTheme: DatePickerThemeData(), // Custom DatePicker theme
        dividerTheme: DividerThemeData(), // Custom Divider theme
        drawerTheme: DrawerThemeData(), // Custom Drawer theme
        dropdownMenuTheme: DropdownMenuThemeData(), // Custom DropdownMenu theme
      );
}
