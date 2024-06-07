import 'package:flutter/material.dart';
import 'package:flutter_template/core/feature/domain/entity/state_manager.dart';
import 'package:flutter_template/core/feature/presentation/widget/overlay_state_manager.dart';
import 'core/app/di/injector.dart';
import 'core/feature/presentation/widget/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initAppModule(),
  ]);

  // Init Loading and error state manger
  locator<OverlayStateManager<LoadingManger>>().init();
  locator<OverlayStateManager<ErrorManger>>().init();

  runApp(MainWrapper());
}
