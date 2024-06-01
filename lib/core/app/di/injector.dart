import 'package:get_it/get_it.dart';

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

  /// Network info
  // locator.registerSingleton<NetworkInfo>(NetworkInfoImpl(Connectivity()));

  /// Dio factory
  // locator.registerSingleton<DioFactory>(DioFactory(locator()));

  /// Network service
  // locator
  // .registerSingleton<NetworkService>(NetworkService(locator(), locator()));
}
