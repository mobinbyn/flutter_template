import 'package:flutter/material.dart';

class AppPalettes {
  // TODO: The template value
  static const int _primarySeedColorValue = 0xFF12967E;
  static const int _secondarySeedColorValue = 0xFFF3B32B;
  static const int _tertiarySeedColorValue = 0xFFF64942;
  static const int _errorSeedColorValue = 0xFFF64942;
  static const int _neutralSeedColorValue = 0xFF646464;
  static const int _neutralVariantSeedColorValue = 0xFF12967E;

  static const Color white = Color(0xFFF1E8ED);
  static const Color black = Color(0xFF2D2D2D);
  static const Color lightYellow = Color(0xFFBFB6B2);

  /// Primary palette
  static const MaterialColor primary = MaterialColor(_primarySeedColorValue, <int, Color>{
    0: Color(0xFF052E27),
    10: Color(0xFF0A5245),
    20: Color(0xFF0A5245),
    30: Color(0xFF0E7361),
    40: Color(0xFF11937C),
    50: Color(0xFF2DA28C),
    60: Color(0xFF48AE9B),
    70: Color(0xFF69BCAD),
    80: Color(0xFF7DC5B8),
    90: Color(0xFF9ED4CA),
    95: Color(0xFFB6DFD7),
    99: Color(0xFFD3EBE7),
    100: Color(0xFFF4FAF9),
  });

  /// Secondary palette
  static const MaterialColor secondary = MaterialColor(
    _secondarySeedColorValue,
    <int, Color>{
      0: Color(0xFF181204),
      10: Color(0xFF4F3A0E),
      20: Color(0xFF876418),
      30: Color(0xFFBB8A21),
      40: Color(0xFFF2B32B),
      50: Color(0xFFF4BB43),
      60: Color(0xFFF5C45C),
      70: Color(0xFFF7CF78),
      80: Color(0xFFF8D68E),
      90: Color(0xFFFADFA7),
      95: Color(0xFFFBE8BF),
      99: Color(0xFFFCF1D7),
      100: Color(0xFFFEFAF2),
    },
  );

  /// Tertiary palette
  static const MaterialColor tertiary = MaterialColor(
    _tertiarySeedColorValue,
    <int, Color>{
      0: Color(0xFF150605),
      10: Color(0xFF471513),
      20: Color(0xFF862724),
      30: Color(0xFFC03933),
      40: Color(0xFFF64A43),
      50: Color(0xFFF75F59),
      60: Color(0xFFF8736E),
      70: Color(0xFFF98783),
      80: Color(0xFFFA9E9A),
      90: Color(0xFFFBB1AE),
      95: Color(0xFFFCC7C5),
      99: Color(0xFFFDDCDB),
      100: Color(0xFFFEF3F3),
    },
  );

  /// Error palette
  static const MaterialColor error = MaterialColor(
    _errorSeedColorValue,
    <int, Color>{
      0: Color(0xFF150605),
      10: Color(0xFF471513),
      20: Color(0xFF862724),
      30: Color(0xFFC03933),
      40: Color(0xFFF64A43),
      50: Color(0xFFF75F59),
      60: Color(0xFFF8736E),
      70: Color(0xFFF98783),
      80: Color(0xFFFA9E9A),
      90: Color(0xFFFBB1AE),
      95: Color(0xFFFCC7C5),
      99: Color(0xFFFDDCDB),
      100: Color(0xFFFEF3F3),
    },
  );

  /// Neutral palette
  static const MaterialColor neutral = MaterialColor(
    _neutralSeedColorValue,
    <int, Color>{
      0: Color(0xFF040404),
      6: Color(0xFF1F1F1F),
      10: Color(0xFF1F1F1F),
      20: Color(0xFF373737),
      30: Color(0xFF4E4E4E),
      40: Color(0xFF646464),
      50: Color(0xFF787878),
      60: Color(0xFF929292),
      70: Color(0xFFA7A7A7),
      80: Color(0xFFBFBFBF),
      90: Color(0xFFD4D4D4),
      95: Color(0xFFEBEBEB),
      98: Color(0xFFF8F8F8),
      99: Color(0xFFF8F8F8),
      100: Color(0xFFFFFFFF),
    },
  );

  /// Neutral variant palette
  static const MaterialColor neutralVariant = MaterialColor(
    _neutralVariantSeedColorValue,
    <int, Color>{
      0: Color(0xFF040404),
      10: Color(0xFF1F1F1F),
      20: Color(0xFF373737),
      30: Color(0xFF4E4E4E),
      40: Color(0xFF646464),
      50: Color(0xFF787878),
      60: Color(0xFF929292),
      70: Color(0xFFA7A7A7),
      80: Color(0xFFBFBFBF),
      90: Color(0xFFD4D4D4),
      95: Color(0xFFEBEBEB),
      99: Color(0xFFF8F8F8),
      100: Color(0xFFFFFFFF),
    },
  );
}
