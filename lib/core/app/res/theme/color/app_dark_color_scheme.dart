import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/color/app_palettes.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';

class AppDarkColorScheme implements IAppThemeStrategy<ColorScheme> {
  @override
  String get label => 'AppDarkColorScheme';
  @override
  ColorScheme? get theme => ColorScheme(
        brightness: Brightness.dark,
        background: AppPalettes.neutral[10]!, // Background color
        onBackground: AppPalettes.white, // Text color on background color elements

        // Primary colors
        primary: AppPalettes.primary[80]!, // Primary color of the app
        onPrimary: AppPalettes.primary[20]!, // Text color on primary color elements
        primaryContainer: AppPalettes.primary[30]!, // Primary color container
        onPrimaryContainer: AppPalettes.primary[90]!, // Text color on primary color container

        // Secondary colors
        secondary: AppPalettes.secondary[80]!, // Secondary color
        onSecondary: AppPalettes.secondary[20]!, // Text color on secondary color elements
        secondaryContainer: AppPalettes.secondary[30]!, // Secondary color container
        onSecondaryContainer: AppPalettes.secondary[90]!, // Text color on secondary color container

        // Tertiary colors
        tertiary: AppPalettes.tertiary[80]!, // Tertiary color
        onTertiary: AppPalettes.tertiary[20]!, // Text color on tertiary color elements
        tertiaryContainer: AppPalettes.tertiary[30]!, // Tertiary color container
        onTertiaryContainer: AppPalettes.tertiary[90]!, // Text color on tertiary color container

        // Error colors
        error: AppPalettes.error[80]!, // Error color (typically red)
        onError: AppPalettes.error[20]!, // Text color on error color elements
        errorContainer: AppPalettes.error[30]!, // Error color container
        onErrorContainer: AppPalettes.error[90]!, // Text color on error color container

        // Neutral colors
        surface: AppPalettes.neutral[6]!, // Surface color
        onSurface: AppPalettes.neutral[90]!, // Text color on surface elements

        // Neutral variant colors
        onSurfaceVariant: AppPalettes.neutralVariant[90]!, // Text color on surface variant elements
        outlineVariant: AppPalettes.neutralVariant[30]!, // Outline color on surface variant elements
        outline: AppPalettes.neutralVariant[60]!, // Outline color

        // Inverse colors
        inversePrimary: AppPalettes.primary[40]!, // Inverse primary color
        inverseSurface: AppPalettes.neutral[90]!, // Inverse surface color
        onInverseSurface: AppPalettes.neutral[20]!, // Text color on inverse surface

        // Other colors
        scrim: AppPalettes.neutral[0]!, // Scrim color
        shadow: AppPalettes.neutral[0]!, // Shadow color
        surfaceTint: null,
        surfaceVariant: null,
      );
}
