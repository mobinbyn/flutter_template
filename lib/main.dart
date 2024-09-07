import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/res/strings/app_language.dart';
import 'core/feature/domain/entity/state_manager.dart';
import 'core/feature/presentation/state/overlay_state_manager.dart';
import 'core/feature/presentation/widget/main_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    initAppModule(),
  ]);

  // Init Loading and error state manger
  locator<OverlayStateManager<LoadingStateManger>>().init();
  locator<OverlayStateManager<FailedStateManger>>().init();

  runApp(
    EasyLocalization(
      supportedLocales: localeList,
      path: assetsPathTranslations,
      child: MainWrapper(),
    ),
  );
}
