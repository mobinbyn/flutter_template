import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/res/strings/app_language.dart';
import 'package:flutter_template/core/feature/presentation/state/state_manager.dart';
import 'core/feature/presentation/widget/main_wrapper.dart';

void main() async {
  /// Init app
  await initApp();

  /// Main wrapper
  runApp(
    EasyLocalization(
      supportedLocales: localeList,
      path: assetsPathTranslations,
      child: MainWrapper(),
    ),
  );
}

/// Initialize app
Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    /// Init screen util
    ScreenUtil.ensureScreenSize(),

    /// Easy Localization
    EasyLocalization.ensureInitialized(),

    /// Dependency injection
    initAppModule(),

    /// Load dot env file
    // dotenv.load(fileName: '.env'),
  ]);

  /// Initial Supabase
  /*
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  */

  /// Init dialog manager
  locator<DialogManager>().init();
}
