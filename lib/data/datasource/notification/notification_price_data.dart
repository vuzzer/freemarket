import 'package:defi/core/enum.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

var logger = Logger();

abstract class NotificationPriceData {
  Future<NotificationCrypto> createNotificationPrice(
      NotificationCrypto createNotification);
  Future<bool> deleteNotificationPrice(int idNotification);
  Future<List<NotificationCrypto>> getNotificationPrice(String cryptoId);
  Future<bool> updateNotification(NotificationCrypto createNotification);
  Future<bool> createNotificationFromList(
      List<NotificationCrypto> createNotification);
  Future<bool> allDailyNotificationIsCreated(String cryptoId);
  Future<List<NotificationCrypto>> allDailyNotificationCreated(String cryptoId);
}

class NotificationPriceDataImpl implements NotificationPriceData {
  static String boxFavoris = "notificationPriceBox";
  static String boxKey = "notifications";

  @override
  Future<NotificationCrypto> createNotificationPrice(
      NotificationCrypto createNotification) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // Add to list of notification
      notifications.add(createNotification.props[0]);

      // Persist data to Hive
      await box.put(boxKey, notifications);

      // Close box and
      await box.close();

      return createNotification;
    } catch (e) {
      throw NotificationExistException();
    }
  }

  @override
  Future<bool> deleteNotificationPrice(int idNotification) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      Logger().d(
          "Debug file notification_price_dart.dart\n Before removed notif $idNotification in $notifications");

      // Remove notification of idNotification
      notifications.removeWhere(
          (notification) => notification["idNotification"] == idNotification);

      //Update box
      await box.put(boxKey, notifications);

      Logger().d(
          "Debug file notification_price_dart.dart\n After removed notif $idNotification in $notifications");

      // Close box and
      await box.close();

      return true;
    } catch (e) {
      Logger().d(e.toString());
      throw DeleteNotificationPriceException();
    }
  }

  @override
  Future<List<NotificationCrypto>> getNotificationPrice(String cryptoId) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    try {
      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // Format data into NotificationPrice
      final notificationsEntities = notifications
          .map((notif) => NotificationCrypto(
              idNotification: notif["idNotification"],
              cryptoId: notif["cryptoId"],
              percent: notif['percent'],
              typeNotification: AlertValue.values[notif['typeNotification']],
              cron: notif["cron"],
              futurePrice: notif["futurePrice"]))
          .toList();

      // Filter notification according id crypto passed as arguments
      final filterNotif = notificationsEntities
          .where((element) => element.cryptoId == cryptoId)
          .toList()
          .reversed
          .toList();

      // Close box and
      await box.close();

      // List of notificaition setup by an user
      return filterNotif;
    } catch (e) {
      throw GetNotificationException();
    }
  }

  @override
  Future<bool> updateNotification(NotificationCrypto updateNotification) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // find notification
      for (var p = 0; p < notifications.length; p++) {
        if (notifications[p]["idNotification"] ==
            updateNotification.idNotification) {
          logger.d('Before update ${notifications[p]}');
          notifications[p] = updateNotification.props[0];
          logger.d('After update ${notifications[p]}');
          break;
        }
      }

      // Persist data to Hive
      await box.put(boxKey, notifications);

      // Close box and
      await box.close();

      return true;
    } catch (e) {
      throw NotificationUpdateException();
    }
  }

  // Create notification from list
  @override
  Future<bool> createNotificationFromList(
      List<NotificationCrypto> createNotification) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // Add to list of notification
      for (var notif in createNotification) {
        notifications.add(notif.props[0]);
      }

      // Persist data to Hive
      await box.put(boxKey, notifications);

      // Close box and
      await box.close();

      return true;
    } catch (e) {
      throw NotificationCreateException();
    }
  }

  @override
  Future<bool> allDailyNotificationIsCreated(String cryptoId) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);
    const allDailyNotif = 3;
    try {
      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // Format data into NotificationPrice
      final notificationsEntities = notifications
          .map((notif) => NotificationCrypto(
              idNotification: notif["idNotification"],
              cryptoId: notif["cryptoId"],
              percent: notif['percent'],
              typeNotification: AlertValue.values[notif['typeNotification']],
              cron: notif["cron"],
              futurePrice: notif["futurePrice"]))
          .toList();

      // Filter notification according id crypto passed as arguments
      final filterNotif = notificationsEntities
          .where((element) =>
              element.cryptoId == cryptoId &&
              element.typeNotification == AlertValue.schedular)
          .toList()
          .reversed
          .toList();

      // Close box and
      await box.close();

      // We check if all daily notification is created
      return filterNotif.length == allDailyNotif;
    } catch (e) {
      throw GetNotificationException();
    }
  }

  @override
  Future<List<NotificationCrypto>> allDailyNotificationCreated(
      String cryptoId) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);
    try {
      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      // Format data into NotificationPrice
      final notificationsEntities = notifications
          .map((notif) => NotificationCrypto(
              idNotification: notif["idNotification"],
              cryptoId: notif["cryptoId"],
              percent: notif['percent'],
              typeNotification: AlertValue.values[notif['typeNotification']],
              cron: notif["cron"],
              futurePrice: notif["futurePrice"]))
          .toList();

      // Filter notification according id crypto passed as arguments
      final filterNotif = notificationsEntities
          .where((element) =>
              element.cryptoId == cryptoId &&
              element.typeNotification == AlertValue.schedular)
          .toList();

      // Close box and
      await box.close();

      // We check if all daily notification is created
      return filterNotif;
    } catch (e) {
      throw GetNotificationException();
    }
  }
}
