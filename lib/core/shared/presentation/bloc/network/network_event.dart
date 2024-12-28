part of 'network_bloc.dart'; // Indicates that this part of the code is part of the network_bloc.dart file

/// Base class for network events, implementing Equatable for value comparison.
sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

/// Event to observe the network status changes.
class NetworkObserve extends NetworkEvent {}

/// Enum to represent different types of network connections.
enum ConnectionType {
  none, // No connection available.
  mobile, // Mobile data connection.
  wifi, // Wi-Fi connection.
  ethernet, // Ethernet connection (if supported).
  bluetooth, // Bluetooth connection.
  vpn, // VPN connection.
  other, // Other connection type.
  unknown, // Unknown connection type.
}

/// Event for notifying about network connectivity status.
class NetworkNotify extends NetworkEvent {
  final bool isConnected; // Indicates whether the device is connected to the internet.
  final ConnectionType connectionType; // Represents the type of connection.

  const NetworkNotify({
    this.isConnected = false,
    this.connectionType = ConnectionType.unknown,
  });

  @override
  List<Object> get props => [isConnected, connectionType]; // Include connectionType for equality comparison.
}
