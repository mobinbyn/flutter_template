import 'package:flutter/material.dart';

/// Extension to provide responsive values based on screen width.
extension Responsive on BuildContext {
  /// Returns a responsive value based on the screen width.
  ///
  /// The method accepts different size configurations:
  /// - [compact]: Default value for smaller screens.
  /// - [medium]: Used for medium-width screens (>= 600).
  /// - [expanded]: Used for expanded-width screens (>= 840).
  /// - [large]: Used for large-width screens (>= 1200).
  /// - [extraLarge]: Used for extra large-width screens (>= 1600).
  T responsive<T>(
    T compact, {
    T? medium,
    T? expanded,
    T? large,
    T? extraLarge,
  }) {
    const double compactThreshold = 600;
    const double mediumThreshold = 840;
    const double largeThreshold = 1200;
    const double extraLargeThreshold = 1600;

    final width = MediaQuery.of(this).size.width;

    if (width >= extraLargeThreshold) return extraLarge ?? large ?? expanded ?? medium ?? compact;
    if (width >= largeThreshold) return large ?? expanded ?? medium ?? compact;
    if (width >= mediumThreshold) return expanded ?? medium ?? compact;
    if (width >= compactThreshold) return medium ?? compact;

    return compact; // Default for compact screens
  }
}
