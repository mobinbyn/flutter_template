import 'package:flutter/material.dart';

abstract class INavigationService {
  // Getter
  GlobalKey<NavigatorState> get navigatorKey;
  // Setter
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey);

  // Methods
  Future<dynamic> navigateTo(String routeName, {Object? arguments});

  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments});

  Future<dynamic> navigateToReplacementAll(String routeName, {Object? arguments});

  void goBack();
}
