part of 'injector_index.dart';

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

  /// Secure Storage
  locator.registerSingleton<AppSecureStorage>((AppSecureStorage()));

  /// State manager
  locator.registerSingleton(OverlayStateManager<LoadingStateManger>(AppConstant.globalNavigatorKey, LoadingStateManger()));
  locator.registerSingleton(OverlayStateManager<FailedStateManger>(AppConstant.globalNavigatorKey, FailedStateManger()));

  /// Dio Wrapper
  locator.registerSingleton<DioWrapper>(DioWrapper());

  /// Network info
  // locator.registerSingleton<NetworkInfo>(NetworkInfoImpl(Connectivity()));

  //********************************************************************
  //* Auth Group
  // *******************************************************************/
  authInitModule();
}

void authInitModule() {
  /// Repository
  locator.registerFactory(() => TokenInterceptor(locator()));

  /// Usecase
  /// Bloc
}
