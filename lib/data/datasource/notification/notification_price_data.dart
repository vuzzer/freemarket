import 'package:defi/core/enum.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

abstract class NotificationPriceData {
  Future<NotificationCrypto> createNotificationPrice(
      NotificationCrypto createNotification);
  Future<bool> deleteNotificationPrice(int idNotification);
  Future<List<NotificationCrypto>> getNotificationPrice();
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
      throw DeleteNotificationPriceException();
    }
  }

  @override
  Future<List<NotificationCrypto>> getNotificationPrice() async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    try {
      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      Logger().d(notifications);

      // Format data into NotificationPrice
      final notificationsEntities = notifications
          .map((notif) => NotificationCrypto(
              idNotification: notif["idNotification"],
              cryptoId: notif["cryptoId"],
              percent: notif['percent'],
              typeNotification: AlertValue.values[notif['typeNotification']],
              futurePrice: notif["futurePrice"]))
          .toList();

      // Close box and
      await box.close();

      // List of notificaition setup by an user
      return notificationsEntities;
    } catch (e) {
      throw GetNotificationPriceException();
    }
  }
}
