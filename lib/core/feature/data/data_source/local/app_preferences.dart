// import 'package:shared_preferences/shared_preferences.dart';

// class AppPreferences {
//   static const String preferencesKeyLang = 'PREF_KEY_LANG';
//   static const String preferencesKeyOnboardingScreen =
//       'PREF_KEY_ONBOARDING_SCREEN';
//   static const String preferencesKeyIsUserLoggedIn =
//       'PREF_KEY_IS_USER_LOGGED_IN';
//   final SharedPreferences _sharedPreferences;

//   AppPreferences(this._sharedPreferences);

//   Future<String> getAppLanguage() async {
//     String? language = _sharedPreferences.getString(preferencesKeyLang);

//     if (language != null && language.isNotEmpty) {
//       return language;
//     } else {
//       return 'p';
//     }
//   }

//   Future<void> setOnBoardingScreenViewed() async {
//     _sharedPreferences.setBool(preferencesKeyOnboardingScreen, true);
//   }

//   Future<bool> isOnBoardingScreenViewed() async {
//     return _sharedPreferences.getBool(preferencesKeyOnboardingScreen) ?? false;
//   }

//   Future<void> setIsUserLoggedIn() async {
//     _sharedPreferences.setBool(preferencesKeyIsUserLoggedIn, true);
//   }

//   Future<bool> isUserLoggedIn() async {
//     return _sharedPreferences.getBool(preferencesKeyIsUserLoggedIn) ?? false;
//   }

//   Future<void> logout() async {
//     _sharedPreferences.remove(preferencesKeyIsUserLoggedIn);
//   }
// }
