abstract class INotificationService {
  Future<bool> handleNotificationPermission();

  Future<bool> hasNotificationPermission();
}
