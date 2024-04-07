import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/data/datasource/notification_price_data.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class BackgroundTask {
  static final configNotification = SetupNotification(AwesomeNotifications());

  // Create notification not scheduled
  static Future<void> createNotificationNotScheduled(
      List cryptoMarketPrice, ServiceInstance instance) async {
    var boxNotification = await Hive.openBox('notificationPriceBox');
    List listNotifications = await boxNotification.get('notifications') ?? [];
    await boxNotification.close();

    // Convert notification to NotificationCrypto
    final notificationEntities = listNotifications
        .map((notif) => NotificationCrypto(
            idNotification: notif["idNotification"],
            cryptoId: notif["cryptoId"],
            percent: notif['percent'],
            typeNotification: AlertValue.values[notif['typeNotification']],
            cron: notif["cron"],
            image: notif["image"],
            futurePrice: notif["futurePrice"]))
        .toList();

    // All notification that kind is not AlertValue.schedular
    final notificationNotScheduled = notificationEntities
        .where((notification) =>
            notification.typeNotification != AlertValue.schedular)
        .toList();

    // create notification
    for (var notification in notificationNotScheduled) {
      final cryptoCurrentPrice = cryptoMarketPrice
          .where((crypto) => crypto['id'] == notification.cryptoId)
          .toList()[0];

      // difference of price
      final differencePrice =
          (cryptoCurrentPrice['price'] - notification.futurePrice).abs();

      // creat notification if diff is less 0.2
      if (differencePrice >= 0 && differencePrice < 0.2) {
        final createdThisDay =
            await notificationIsTriggerThisDay(notification.idNotification);
        if (!createdThisDay) {
          // Display notification to screen
          if (await configNotification.awesomeNotifications
              .isNotificationAllowed()) {
            // create notification display to user
            configNotification.createAlertNotificationAsync(notification);
          }

          // Register date of notification create
          await createHistoryNotification(
              notification.idNotification, instance);
        }
      } else {
        //Logger().d('Notification not created');
      }
    }
  }

  // Check if notification has already triggered this day
  static Future<bool> notificationIsTriggerThisDay(int idNotification) async {
    var historyNotificationBox =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    List history = await historyNotificationBox.get(idNotification) ?? [];
    await historyNotificationBox.close();

    if (history.isNotEmpty) {
      // Format date is y/M/d
      final currentDate = DateFormat.yMd().format(DateTime.now());
      final lastNotificationDate =
          DateFormat.yMd().format(history.last['date']);
      return currentDate == lastNotificationDate;
    }
    return false;
  }

  // Log notification triggered
  static Future<void> createHistoryNotification(
      int idNotification, ServiceInstance instance) async {
    var historyNotificationBox =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    List history = await historyNotificationBox.get(idNotification) ?? [];

    // Get history of specific notification
    final notificationRegistered =
        await NotificationPriceDataImpl().getNotificationById(idNotification);
    var objNotification = notificationRegistered.props[0];

    // Open box that hold all notification triggered
    var allNotificationTriggeredBox =
        await Hive.openBox(HiveBoxName.allNotificationTriggeredBox);
    List allNotificationTriggered =
        await allNotificationTriggeredBox.get('all') ?? [];

    // insert to box for this specific notification
    final createdAt = DateTime.now();
    history.add({'date': createdAt, 'open': false});
    historyNotificationBox.put(idNotification, history);

    // add date and notification statut
    objNotification['date'] = createdAt;
    objNotification['open'] = false;

    // add notification to history
    allNotificationTriggered.add(objNotification);
    allNotificationTriggeredBox.put('all', allNotificationTriggered);

/*     //Update number of notification active
    int numberActiveNotification = 0;
    for (var history in historyNotificationBox.values) {
      for (var logs in history) {
        if (!logs['open']) {
          numberActiveNotification += 1;
        }
      }
    }
    var boxCountNotificationBox =
        await Hive.openBox(HiveBoxName.countNotificationBox);
    boxCountNotificationBox.put('activeNotification', numberActiveNotification);

    // Send number active notification to UI
    instance.invoke('count', {'count': numberActiveNotification});

    await boxCountNotificationBox.close(); */
    await historyNotificationBox.close();
    await allNotificationTriggeredBox.close();
  }

  static Future<void> clearBoxNotification() async {
    // clean all notification history for notification_screen
    var allNotificationTriggeredBox =
        await Hive.openBox(HiveBoxName.allNotificationTriggeredBox);
    await allNotificationTriggeredBox.clear();

    // clean all notification triggered for specific notifications
    var historyNotificationBox =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    await historyNotificationBox.clear();

    // clean count for notification
    var countNotificationBox =
        await Hive.openBox(HiveBoxName.countNotificationBox);
    await countNotificationBox.clear();

    //close box
    await countNotificationBox.close();
    await historyNotificationBox.close();
    await allNotificationTriggeredBox.close();
  }
}
