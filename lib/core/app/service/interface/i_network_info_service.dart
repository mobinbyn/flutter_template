abstract class INetworkInfoService {
  Future<bool> get isConnected;
  void observeNetworkStatus() {}
}
