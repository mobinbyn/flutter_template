import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/theme/app_theme.dart';
import 'package:flutter_template/core/feature/data/data_source/local/app_preferences.dart';

class ThemesCubit extends Cubit<ThemeData> {
  final AppPreferences _appPreferences;
  ThemesCubit(this._appPreferences) : super(ThemeMode.system == ThemeMode.dark ? AppThemes().darkTheme : AppThemes().lightTheme) {
    _getThemeFromPrefs();
  }

  void toggleTheme() {
    emit(state.brightness == Brightness.light ? AppThemes().darkTheme : AppThemes().lightTheme);
    _saveThemeToPrefs(brightness: state.brightness);
  }

  Future<void> _saveThemeToPrefs({required Brightness brightness}) async {
    _appPreferences.hasDark(brightness == Brightness.dark);
  }

  Future<void> _getThemeFromPrefs() async {
    bool isDark = _appPreferences.isDark();
    final savedTheme = isDark ? AppThemes().darkTheme : AppThemes().lightTheme;
    emit(savedTheme);
  }
}
