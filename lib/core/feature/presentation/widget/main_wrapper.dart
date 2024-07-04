import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/di/injector_index.dart';
import '../../../app/res/theme/app_theme.dart';
import '../../../app/res/const/app_nav_key.dart';
import '../../../app/routes/routes.dart';
import '../../../app/routes/routes_index.dart';

class MainWrapper extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<AppNavKey>().globalNavigationKey,
      onGenerateRoute: _routeGenerator.getRoute,
      initialRoute: AppRoutes.splashRoute,
      builder: (BuildContext context, Widget? child) {
        ScreenUtil.init(
          context,
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
        );
        return Theme(
          data: AppThemes().lightTheme(),
          child: child!,
        );
      },
    );
  }
}
