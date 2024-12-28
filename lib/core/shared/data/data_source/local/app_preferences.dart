import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String preferencesKeyLang = 'PREF_KEY_LANG';
  static const String preferencesKeyThemeMode = 'PREF_KEY_THEME_MODE';
  static const String preferencesKeyIsUserLoggedIn = 'PREF_KEY_IS_USER_LOGGED_IN';
  static const String preferencesKeyOnboardingScreen = 'PREF_KEY_ONBOARDING_SCREEN';

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(preferencesKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return 'p';
    }
  }

  void setTheme(String themeMode) async {
    _sharedPreferences.setString(preferencesKeyThemeMode, themeMode);
  }

  String getTheme() {
    return _sharedPreferences.getString(preferencesKeyThemeMode) ?? '';
  }

  void setOnBoardingScreenViewed() {
    _sharedPreferences.setBool(preferencesKeyOnboardingScreen, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(preferencesKeyOnboardingScreen) ?? false;
  }

  void setIsUserLoggedIn() {
    _sharedPreferences.setBool(preferencesKeyIsUserLoggedIn, true);
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(preferencesKeyIsUserLoggedIn) ?? false;
  }

  void logout() {
    _sharedPreferences.remove(preferencesKeyIsUserLoggedIn);
  }

  Future<bool> clearAll() async {
    return await _sharedPreferences.clear();
  }
}
