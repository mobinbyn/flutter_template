import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigatorKey;

  NavigationService(this._navigatorKey);

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacementAll(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => route.isFirst, arguments: arguments);
  }

  void goBack() {
    return _navigatorKey.currentState!.pop();
  }
}
