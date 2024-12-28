// TODO: The template value
import 'package:flutter/material.dart';

enum LanguageType { english, persian, turkish }

const String persian = 'fa';
const String english = 'en';
const String turkish = 'tr';
const String assetsPathTranslations = 'assets/translations';
const Locale persianLocal = Locale('fa', 'IR');
const Locale englishLocal = Locale('en', 'US');
const Locale turkishLocal = Locale('tr', 'TR');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.persian:
        return persian;
      case LanguageType.turkish:
        return turkish;
    }
  }
}

List<Locale> get localeList => [
      englishLocal,
      turkishLocal,
      persianLocal,
    ];
