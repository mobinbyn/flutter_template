import 'package:flutter/material.dart';

class AppNavKey {
  final GlobalKey<NavigatorState> globalNavigationKey = GlobalKey<NavigatorState>();
  late GlobalKey<NavigatorState> subNavigationKey;
}
