import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/service/interface/i_network_info_service.dart';
import 'package:flutter_template/core/feature/data/data_source/error/data_source_enum.dart';
import 'package:flutter_template/core/feature/data/data_source/error/data_source_extension.dart';
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
    locator<INetworkInfoService>().observeNetworkStatus();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? _dialogManager.failedManager.hide()
        : _dialogManager.failedManager.show(
            DataSource.noInternetConnection.getFailure(),
          );
  }
}
