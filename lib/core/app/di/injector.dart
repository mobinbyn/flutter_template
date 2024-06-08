import 'package:flutter_template/core/feature/data/data_source/remote/dio_factory.dart';
import 'package:get_it/get_it.dart';
import 'index.dart';

final locator = GetIt.instance;

Future<void> initAppModule() async {
  //********************************************************************
  //* Core Group
  // *******************************************************************/
  // TODO: The template value
  /// Shared Preferences
  // final sharedPreferences = await SharedPreferences.getInstance();
  // locator.registerSingleton<SharedPreferences>(sharedPreferences);
  // locator.registerSingleton<AppPreferences>(AppPreferences(locator()));

  /// State manager
  locator.registerSingleton(OverlayStateManager<LoadingStateManger>(
      AppConstant.globalNavigatorKey, LoadingStateManger()));
  locator.registerSingleton(OverlayStateManager<FailedStateManger>(
      AppConstant.globalNavigatorKey, FailedStateManger()));

  /// Dio factory
  locator.registerSingleton<DioFactory>(DioFactory());

  /// Network info
  // locator.registerSingleton<NetworkInfo>(NetworkInfoImpl(Connectivity()));
}
