import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/di/injector.dart';
import 'package:flutter_template/core/feature/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initAppModule(),
  ]);
  runApp(MainWrapper());
}
