import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/service/network_info_service.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';
import 'package:flutter_template/core/feature/data/data_source/error/response_code.dart';
import 'package:flutter_template/core/feature/presentation/state/state_manager.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc(this._dialogManager) : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  final DialogManager _dialogManager;

  void _observe(event, emit) {
    locator<NetworkInfoService>().observeNetworkStatus();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? _dialogManager.failedManager.hide()
        : _dialogManager.failedManager.show(
            Failure(
              ResponseMessage.noInternetConnection.tr(),
              metadata: (code: ResponseCode.noInternetConnection, description: 'No Internet Connection!', statusCode: 0),
            ),
          );
  }
}
