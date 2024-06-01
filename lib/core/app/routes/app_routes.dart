import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/res/strings/app_strings.dart';

class RouteGenerator {
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      default:
        return _unDefinedRoute();
    }
  }

  Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.notRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.notRouteFound),
        ),
      ),
    );
  }
}
