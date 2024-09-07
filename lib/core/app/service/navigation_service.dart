import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/service/interface/i_navigation_service.dart';

class NavigationService extends INavigationService {
  GlobalKey<NavigatorState> _navigatorKey;

  NavigationService(this._navigatorKey);

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  @override
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> navigateToReplacementAll(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => route.isFirst, arguments: arguments);
  }

  @override
  void goBack() {
    return _navigatorKey.currentState!.pop();
  }
}
