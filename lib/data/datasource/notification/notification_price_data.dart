import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

abstract class NotificationPriceData {
  Future<NotificationPrice> createNotificationPrice(
      {required String cryptoId, required double price, required int id});
  Future<bool> deleteNotificationPrice(int idNotification);
  Future<List<NotificationPrice>> getNotificationPrice();
}

class NotificationPriceDataImpl implements NotificationPriceData {
  static String boxFavoris = "notificationPriceBox";
  static String boxKey = "notifications";

  @override
  Future<NotificationPrice> createNotificationPrice(
      {required String cryptoId,
      required double price,
      required int id}) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    // Get list of favoris
    List notifications = await box.get(boxKey) ?? [];

    // Search if notification to set already exist
    final notification = notifications
        .where((value) =>
            value["cryptoId"] == cryptoId && value["futurePrice"] == price)
        .toList();

    // If notification not exist, it is created.
    // Otherwise, Exception is raised
    if (notification.isEmpty) {
      final notifCreated = NotificationPrice(
          idNotification: id, cryptoId: cryptoId, futurePrice: price);

      // Add to list of notification
      notifications.add(notifCreated.props[0]);

      // Persist data to Hive
      await box.put(boxKey, notifications);

      // Close box and
      await box.close();

      return notifCreated;
    }
    throw NotificationExistException();
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
  Future<List<NotificationPrice>> getNotificationPrice() async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    try {
      // Get list of favoris
      List notifications = await box.get(boxKey) ?? [];

      Logger().d(notifications);

      // Format data into NotificationPrice
      final notificationsEntities = notifications
          .map((notif) => NotificationPrice(
              idNotification: notif["idNotification"],
              cryptoId: notif["cryptoId"],
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
