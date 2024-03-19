abstract class BrightnessRepo {
  Future<int> getActiveNotification();
  Future<int> updateActiveNotification(int activeNotification);
}