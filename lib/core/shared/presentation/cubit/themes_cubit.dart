import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/app_dark_theme.dart';
import 'package:flutter_template/core/app/res/theme/app_light_theme.dart';
import 'package:flutter_template/core/app/res/theme/app_theme_factory.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';
import 'package:flutter_template/core/shared/data/data_source/local/app_preferences.dart';

class ThemesCubit extends Cubit<IAppThemeStrategy<ThemeData>> {
  final AppPreferences _appPreferences;
  ThemesCubit(this._appPreferences) : super(ThemeMode.system == ThemeMode.dark ? AppDarkTheme() : AppLightTheme()) {
    _getThemeFromPrefs();
  }

  void changeTheme(IAppThemeStrategy<ThemeData> theme) {
    emit(theme);
    _saveThemeToPrefs(theme.label);
  }

  // This function is only used for dark and light themes
  void toggleTheme() {
    emit(state.label == 'light' ? AppDarkTheme() : AppLightTheme());
    _saveThemeToPrefs(state.label);
  }

  Future<void> _saveThemeToPrefs(String themeMode) async {
    _appPreferences.setTheme(themeMode);
  }

  Future<void> _getThemeFromPrefs() async {
    String themeMode = _appPreferences.getTheme();
    IAppThemeStrategy<ThemeData> themeStrategy = AppThemeFactory().createTheme(themeMode);

    emit(themeStrategy);
  }
}
