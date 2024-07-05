import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/data/data_source/local/app_preferences.dart';
import '../../feature/data/data_source/local/app_secure_storage.dart';
import '../../feature/data/data_source/remote/dio_wrapper.dart';
import '../../feature/data/data_source/remote/token_interceptor.dart';
import '../../feature/domain/entity/state_manager.dart';
import '../../feature/presentation/cubit/themes_cubit.dart';
import '../../feature/presentation/state/overlay_state_manager.dart';
import '../res/const/app_nav_key.dart';
import '../service/navigation_service.dart';

part 'injector.dart';
