import 'package:flutter_template/core/app/res/const/app_nav_key.dart';
import 'package:flutter_template/core/app/service/navigation_service.dart';
import 'package:get_it/get_it.dart';

import '../../feature/data/data_source/local/app_secure_storage.dart';
import '../../feature/data/data_source/remote/dio_wrapper.dart';
import '../../feature/data/data_source/remote/token_interceptor.dart';
import '../../feature/domain/entity/state_manager.dart';
import '../../feature/presentation/state/overlay_state_manager.dart';

part 'injector.dart';
