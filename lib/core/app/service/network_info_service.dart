import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/service/interface/i_network_info_service.dart';
import 'package:flutter_template/core/app/utility/logging_mixin.dart';
import 'package:flutter_template/core/shared/presentation/bloc/network/network_bloc.dart';

/// A service class that implements [INetworkInfoService] to provide
/// information about the current network status.
/// It also observes network changes using [Connectivity].
class NetworkInfoService with LogMixin implements INetworkInfoService {
  final Connectivity connectivity;

  NetworkInfoService(this.connectivity);

  /// Checks whether the device is connected to any network.
  /// Returns `true` if connected, otherwise `false`.
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  /// Listens to network status changes and logs them.
  /// Depending on the network status, it dispatches events to [NetworkBloc].
  @override
  void observeNetworkStatus() {
    connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      logger.d('Network status changed: $result'); // Logs network changes.

      // Get the first element from the result list
      final connectivityStatus = result.first;

      switch (connectivityStatus) {
        case ConnectivityResult.none:
          // No connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: false, connectionType: ConnectionType.none));
          break;

        case ConnectivityResult.mobile:
          // Mobile data connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.mobile));
          break;

        case ConnectivityResult.wifi:
          // Wi-Fi connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.wifi));
          break;

        case ConnectivityResult.ethernet:
          // Ethernet connection (if supported)
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.ethernet));
          break;

        case ConnectivityResult.bluetooth:
          // Bluetooth connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.bluetooth));
          break;

        case ConnectivityResult.vpn:
          // VPN connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.vpn));
          break;

        case ConnectivityResult.other:
          // Other connection
          locator<NetworkBloc>().add(const NetworkNotify(isConnected: true, connectionType: ConnectionType.other));
          break;

        // default:
        //   // Unknown connection type
        //   locator<NetworkBloc>().add(const NetworkNotify(isConnected: false, connectionType: ConnectionType.unknown));
      }
    });
  }
}
