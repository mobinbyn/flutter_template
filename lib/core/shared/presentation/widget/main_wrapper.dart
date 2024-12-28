import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/app/res/theme/interface/i_app_theme_strategy.dart';
import 'package:flutter_template/core/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_template/core/shared/presentation/bloc/network/network_bloc.dart';
import 'package:flutter_template/core/shared/presentation/cubit/themes_cubit.dart';

import '../../../app/di/injector_index.dart';
import '../../../app/res/const/app_nav_key.dart';
import '../../../app/routes/routes.dart';
import '../../../app/routes/routes_index.dart';

class MainWrapper extends StatelessWidget {
  final RouteGenerator _routeGenerator = RouteGenerator();
  MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<NetworkBloc>()..add(NetworkObserve()), lazy: false),
        BlocProvider(create: (_) => locator<ThemesCubit>(), lazy: true),
        BlocProvider(create: (_) => locator<AuthBloc>(), lazy: false),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
          return BlocBuilder<ThemesCubit, IAppThemeStrategy<ThemeData>>(
            builder: (context, state) {
              return Theme(
                data: state.theme!,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
