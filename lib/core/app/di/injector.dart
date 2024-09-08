part of 'injector_index.dart';

final locator = GetIt.instance;

Future<void> initAppModule() async {
  //********************************************************************
  //* Core Group
  // *******************************************************************/
  // TODO: The template value
  /// Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<AppPreferences>(AppPreferences(locator()));

  /// Secure Storage
  locator.registerSingleton<AppSecureStorage>((AppSecureStorage()));

  /// Global Navigator Key
  locator.registerSingleton<AppNavKey>(AppNavKey());

  /// State manager (Dialog Manager)
  locator.registerSingleton<LoadingManager>(LoadingManager());
  locator.registerSingleton<FailedManager>(FailedManager());
  locator.registerSingleton<DialogManager>(DialogManager(locator<AppNavKey>().globalNavigationKey, locator(), locator()));

  /// Navigation Service
  locator.registerSingleton<NavigationService>(NavigationService(locator<AppNavKey>().globalNavigationKey));

  /// Theme Cubit
  // locator.registerSingleton<ThemesCubit>(ThemesCubit(locator()));

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
  // locator.registerFactory(() => TokenInterceptor(locator()));
  // locator.registerFactory(() => AuthInterceptor(dio: dio, authenticationService: locator()));

  /// Usecase
  /// Bloc
}
