import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/const/app_font.dart';
import 'package:flutter_template/core/app/res/theme/color/app_dark_color_scheme.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_appbar_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_checkbox_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_chip_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_elevated_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_filled_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_floating_action_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_icon_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_icon_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_input_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_outlined_button_theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_text_button.theme.dart';
import 'package:flutter_template/core/app/res/theme/custom_theme/app_text_theme.dart';

class AppDarkTheme implements IAppThemeStrategy<ThemeData> {
  @override
  String get label => 'dark';

  @override
  ThemeData? get theme => ThemeData(
        useMaterial3: true, // Enables Material Design 3 components
        brightness: Brightness.dark, // Defines the overall theme brightness as light
        // scaffoldBackgroundColor: AppPalettes.neutral[99], // Sets the background color for Scaffold
        colorScheme: AppDarkColorScheme().theme, // Sets the color scheme for the app

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
