part of 'routes_index.dart';

class RouteGenerator {
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const TestPage();
          },
        );
      default:
        return _unDefinedRoute();
    }
  }

  Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.notRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.notRouteFound),
        ),
      ),
    );
  }
}
