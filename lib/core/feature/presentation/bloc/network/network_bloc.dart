import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/app/service/interface/i_network_info_service.dart';
import 'package:flutter_template/core/feature/data/data_source/error/data_source_enum.dart';
import 'package:flutter_template/core/feature/data/data_source/error/data_source_extension.dart';
import 'package:flutter_template/core/feature/presentation/state/state_manager.dart';

part 'network_event.dart';
part 'network_state.dart';

/// BLoC class to manage network state and events.
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  /// Constructor for the NetworkBloc that initializes with a [DialogManager].
  NetworkBloc(this._dialogManager) : super(NetworkInitial()) {
    on<NetworkObserve>(_observe); // Event handler for observing network status.
    on<NetworkNotify>(_notifyStatus); // Event handler for network status notifications.
  }

  final DialogManager _dialogManager; // Dialog manager for handling UI dialogs.

  /// Observes network status changes by calling the respective service.
  void _observe(NetworkObserve event, emit) {
    locator<INetworkInfoService>().observeNetworkStatus();
  }

  /// Notifies the current status of the network connection.
  /// If connected, hides any failure dialogs; if disconnected, shows the failure dialog.
  void _notifyStatus(NetworkNotify event, emit) {
    if (event.isConnected) {
      // If connected to the internet, hide any failure dialogs.
      _dialogManager.failedManager.hide();

      // Optionally, you can log a success message or perform additional actions here.
      // logger.d('Network connected.'); // Uncomment to log connection.
    } else {
      // If not connected, show the failure dialog with the appropriate message.
      _dialogManager.failedManager.show(
        DataSource.noInternetConnection.getFailure(), // Get failure message for no internet connection.
      );

      // Optionally, you can log a failure message or perform additional actions here.
      // logger.d('Network disconnected.'); // Uncomment to log disconnection.
    }
  }
}
