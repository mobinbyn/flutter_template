import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/color/app_palettes.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';

class AppLightColorScheme implements IAppThemeStrategy<ColorScheme> {
  @override
  String get label => 'AppLightColorScheme';
  @override
  ColorScheme? get theme => ColorScheme(
        brightness: Brightness.light,
        background: AppPalettes.neutral[100]!, // Background color
        onBackground: AppPalettes.neutral[10]!, // Text color on background color elements

        // Primary colors
        primary: AppPalettes.primary[40]!, // Primary color of the app
        onPrimary: AppPalettes.primary[100]!, // Text color on primary color elements
        primaryContainer: AppPalettes.primary[90]!, // Primary color container
        onPrimaryContainer: AppPalettes.primary[10]!, // Text color on primary color container

        // Secondary colors
        secondary: AppPalettes.secondary[40]!, // Secondary color
        onSecondary: AppPalettes.secondary[100]!, // Text color on secondary color elements
        secondaryContainer: AppPalettes.secondary[90]!, // Secondary color container
        onSecondaryContainer: AppPalettes.secondary[10]!, // Text color on secondary color container

        // Tertiary colors
        tertiary: AppPalettes.tertiary[40]!, // Tertiary color
        onTertiary: AppPalettes.tertiary[100]!, // Text color on tertiary color elements
        tertiaryContainer: AppPalettes.tertiary[90]!, // Tertiary color container
        onTertiaryContainer: AppPalettes.tertiary[10]!, // Text color on tertiary color container

        // Error colors
        error: AppPalettes.error[40]!, // Error color (typically red)
        onError: AppPalettes.error[100]!, // Text color on error color elements
        errorContainer: AppPalettes.error[90]!, // Error color container
        onErrorContainer: AppPalettes.error[10]!, // Text color on error color container

        // Neutral colors
        surface: AppPalettes.neutral[98]!, // Surface color
        onSurface: AppPalettes.neutral[10]!, // Text color on surface elements

        // Neutral variant colors
        onSurfaceVariant: AppPalettes.neutralVariant[30]!, // Text color on surface variant elements
        outlineVariant: AppPalettes.neutralVariant[80]!, // Outline color on surface variant elements
        outline: AppPalettes.neutralVariant[50]!, // Outline color

        // Inverse colors
        inversePrimary: AppPalettes.primary[80]!, // Inverse primary color
        inverseSurface: AppPalettes.neutral[20]!, // Inverse surface color
        onInverseSurface: AppPalettes.neutral[95]!, // Text color on inverse surface

        // Other colors
        scrim: AppPalettes.neutral[0]!, // Scrim color
        shadow: AppPalettes.neutral[0]!, // Shadow color
        surfaceTint: null,
        surfaceVariant: null,
      );
}
