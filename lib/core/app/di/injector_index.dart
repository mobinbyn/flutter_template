// ignore_for_file: unused_import

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/core/app/service/authentication_service.dart';
import 'package:flutter_template/core/app/service/interface/i_authentication_service.dart';
import 'package:flutter_template/core/app/service/interface/i_navigation_service.dart';
import 'package:flutter_template/core/app/service/interface/i_network_info_service.dart';
import 'package:flutter_template/core/app/service/network_info_service.dart';
import 'package:flutter_template/core/shared/data/data_source/remote/jwt_interceptor.dart';
import 'package:flutter_template/core/shared/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_template/core/shared/presentation/bloc/network/network_bloc.dart';
import 'package:flutter_template/core/shared/presentation/state/state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/data/data_source/local/app_preferences.dart';
import '../../shared/data/data_source/local/app_secure_storage.dart';
import '../../shared/data/data_source/remote/dio_wrapper.dart';
import '../../shared/data/data_source/remote/token_interceptor.dart';
import '../../shared/presentation/cubit/themes_cubit.dart';
import '../res/const/app_nav_key.dart';
import '../service/navigation_service.dart';

part 'injector.dart';
