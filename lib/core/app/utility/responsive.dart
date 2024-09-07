import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T compact, {
    T? medium, // Medium
    T? expanded, // Expanded
    T? large, // Large
    T? extraLarge, // Extra Large
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1600
        ? (extraLarge ?? large ?? expanded ?? medium ?? compact)
        : wd >= 1200
            ? (large ?? expanded ?? medium ?? compact)
            : wd >= 840
                ? (expanded ?? medium ?? compact)
                : wd >= 600
                    ? (medium ?? compact)
                    : compact;
  }
}
