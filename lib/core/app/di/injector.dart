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

  /// Network info service & Bloc
  locator.registerSingleton<INetworkInfoService>(NetworkInfoService(Connectivity()));
  locator.registerSingleton<NetworkBloc>(NetworkBloc(locator()));

  /// Navigation Service
  locator.registerSingleton<INavigationService>(NavigationService(locator<AppNavKey>().globalNavigationKey));

  /// Theme Cubit
  locator.registerLazySingleton<ThemesCubit>(() => ThemesCubit(locator())); // This cubit must be initialized in lazy mode.

  /// Dio Wrapper
  locator.registerSingleton<DioWrapper>(DioWrapper());

  /// Authentication Service & Bloc
  locator.registerSingleton<IAuthenticationService>(AuthenticationService(locator(), locator(), locator(), locator()));
  locator.registerSingleton<AuthBloc>(AuthBloc(locator()));

  //********************************************************************
  //* Sign In Group
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
