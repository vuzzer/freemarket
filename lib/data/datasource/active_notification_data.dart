import 'package:defi/core/hive_box_name.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ActiveNotificationData {
  Future<int> getActiveNotification();
  Future<int> updateActiveNotification(int activeNotification);
}

class ActiveNotificationDataImpl implements ActiveNotificationData {
  @override
  Future<int> getActiveNotification() async {
      var historyNotificationBox =
          await Hive.openBox(HiveBoxName.notificationHistoryBox);
      int numberActiveNotification = 0;
      for (var history in historyNotificationBox.values) {
        for (var logs in history) {
          if (!logs['open']) {
            numberActiveNotification += 1;
          }
        }
      }
      historyNotificationBox.close();

    return numberActiveNotification;
  }

  @override
  Future<int> updateActiveNotification(int activeNotification) async {
    return activeNotification;
  }
}
