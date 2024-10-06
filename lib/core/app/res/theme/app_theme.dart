import 'package:flutter/material.dart';
import '../const/app_font.dart';
import 'app_button_theme.dart';
import 'app_input_theme.dart';
import 'app_palettes.dart';
import 'app_text_style.dart';

// TODO: Template value to be defined later
// The AppThemes class is used to manage theme configurations for the app
class AppThemes {
  // Private constructor to prevent object creation
  AppThemes._();

  /// Light theme configuration
  /// This sets up the light theme for the app using various customized elements
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true, // Enables Material Design 3 components
        brightness: Brightness.light, // Defines the overall theme brightness as light
        scaffoldBackgroundColor: AppPalettes.neutral[99], // Sets the background color for Scaffold
        colorScheme: ColorScheme(
          background: AppPalettes.neutral[100]!, // Background color
          brightness: Brightness.light, // Light mode color scheme
          primary: AppPalettes.primary, // Primary color of the app
          onPrimary: AppPalettes.white, // Text color on primary color elements
          secondary: AppPalettes.secondary, // Secondary color
          onSecondary: AppPalettes.black, // Text color on secondary color elements
          error: AppPalettes.tertiary, // Error color (typically red)
          onError: AppPalettes.white, // Text color on error color elements
          onBackground: AppPalettes.black, // Text color on background color elements
          surface: AppPalettes.neutral[100]!, // Surface color
          onSurface: AppPalettes.black, // Text color on surface elements
        ),

        /// Button themes
        buttonTheme: ButtonThemeData(), // General button theme (legacy)
        outlinedButtonTheme: AppButtonTheme.primaryOutline, // Theme for outlined buttons
        filledButtonTheme: AppButtonTheme.primary, // Theme for filled buttons
        textButtonTheme: AppButtonTheme.textButton, // Theme for text buttons
        iconButtonTheme: IconButtonThemeData(), // Theme for icon buttons
        floatingActionButtonTheme: FloatingActionButtonThemeData(), // Theme for FAB

        /// Input decoration theme (Text form fields)
        inputDecorationTheme: AppInputTheme.textFilledTheme, // Custom input field styling

        /// Text theme
        textTheme: AppTextTheme.lightTextTheme, // Custom text styles for light theme
        fontFamily: AppFontFamily.fontFamily, // Custom font family

        /// Icon theme
        iconTheme: IconThemeData(color: AppPalettes.primary), // Icon color
        actionIconTheme: ActionIconThemeData(), // Custom action icon theme
        appBarTheme: AppBarTheme(), // Custom AppBar theme
        badgeTheme: BadgeThemeData(), // Custom Badge theme
        bannerTheme: MaterialBannerThemeData(), // Custom Banner theme
        bottomAppBarTheme: BottomAppBarTheme(), // Custom BottomAppBar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(), // Custom BottomNavigationBar theme
        bottomSheetTheme: BottomSheetThemeData(), // Custom BottomSheet theme
        toggleButtonsTheme: ToggleButtonsThemeData(), // Custom ToggleButtons theme
        chipTheme: ChipThemeData(), // Custom Chip theme
        checkboxTheme: CheckboxThemeData(), // Custom Checkbox theme
        cardTheme: CardTheme(), // Custom Card theme
        dialogTheme: DialogTheme(), // Custom Dialog theme
        datePickerTheme: DatePickerThemeData(), // Custom DatePicker theme
        dividerTheme: DividerThemeData(), // Custom Divider theme
        drawerTheme: DrawerThemeData(), // Custom Drawer theme
        dropdownMenuTheme: DropdownMenuThemeData(), // Custom DropdownMenu theme

        // Uncomment the following block for custom chip styling
        // chipTheme: ChipThemeData(
        //   backgroundColor: AppPalettes.white,
        //   selectedColor: AppPalettes.white,
        //   labelStyle: AppTextStyle.getRegularStyle(
        //       fontSize: AppFontSize.s14, color: AppPalettes.black),
        //   pressElevation: 0.0,
        //   labelPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        // ),

        // Uncomment the following block for custom checkbox styling
        // checkboxTheme: CheckboxThemeData(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(4.r),
        //     ),
        //     fillColor: MaterialStateColor.resolveWith(
        //         (states) => AppPalettes.primary[50]!)),
      );

  /// Dark theme configuration (currently not defined)
  static ThemeData get darkTheme => ThemeData();
}
