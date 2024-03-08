import 'package:defi/core/hive_box_name.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ActiveNotificationData {
  Future<int> getActiveNotification();
  Future<int> updateActiveNotification();
}

class ActiveNotificationDataImpl implements ActiveNotificationData {
  @override
  Future<int> getActiveNotification() async {
    var boxCountNotificationBox =
        await Hive.openBox(HiveBoxName.countNotificationBox);
    int numberActiveNotification =
        boxCountNotificationBox.get('activeNotification') ?? 0;

    // close box
    await boxCountNotificationBox.close();

    return numberActiveNotification;
  }

  @override
  Future<int> updateActiveNotification() async {
    int numberActiveNotification = 0;

    var boxHistoryNotification =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);

    for (var history in boxHistoryNotification.values) {
      for (var logs in history) {
        if (!logs['open']) {
          numberActiveNotification += 1;
        }
      }
    }

    var boxCountNotificationBox =
        await Hive.openBox(HiveBoxName.countNotificationBox);
    boxCountNotificationBox.put('activeNotification', numberActiveNotification);

    // close box
    await boxCountNotificationBox.close();
    await boxHistoryNotification.close();


    return numberActiveNotification;
  }
}
