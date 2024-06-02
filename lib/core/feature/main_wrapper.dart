import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/app/res/theme/app_theme.dart';
import 'package:flutter_template/core/app/routes/app_routes.dart';
import 'package:flutter_template/core/app/routes/routes.dart';

class MainWrapper extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
