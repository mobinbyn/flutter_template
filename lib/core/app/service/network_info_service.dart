import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/service/interface/i_network_info_service.dart';
import 'package:flutter_template/core/app/utility/logging_mixin.dart';
import 'package:flutter_template/core/feature/presentation/bloc/network/network_bloc.dart';

class NetworkInfoService with LogMixin implements INetworkInfoService {
  final Connectivity connectivity;

  NetworkInfoService(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  void observeNetworkStatus() {
    connectivity.onConnectivityChanged.listen((result) {
      logger.d('Network status changed: $result');
      if (result.contains(ConnectivityResult.none)) {
        locator<NetworkBloc>().add(const NetworkNotify());
      } else {
        locator<NetworkBloc>().add(const NetworkNotify(isConnected: true));
      }
    });
  }
}
