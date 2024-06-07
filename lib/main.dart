import 'package:flutter/material.dart';
import 'core/app/di/injector.dart';
import 'core/feature/presentation/widget/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initAppModule(),
  ]);
  runApp(MainWrapper());
}
