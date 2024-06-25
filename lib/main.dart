import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'core/feature/domain/entity/state_manager.dart';
import 'core/feature/presentation/widget/overlay_state_manager.dart';
import 'core/feature/presentation/widget/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    initAppModule(),
  ]);

  // Init Loading and error state manger
  locator<OverlayStateManager<LoadingStateManger>>().init();
  locator<OverlayStateManager<FailedStateManger>>().init();

  runApp(MainWrapper());
}
