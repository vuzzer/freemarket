import 'package:defi/core/create_unique_id.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      {required String cryptoId, required double price, required int id }) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    // Get list of favoris
    List notifications =
        await box.get(boxKey) ?? [];

    // Search if notification to set already exist
    final notification = notifications
        .where(
            (value) => value.cryptoId == cryptoId && value.futurePrice == price)
        .toList();

    // If notification not exist, it is created.
    // Otherwise, Exception is raised
    if (notification.isEmpty) {
      final notifCreated = NotificationPrice(
          idNotification: id,
          cryptoId: cryptoId,
          futurePrice: price);

      // Add to list of notification
      notifications.add(notifCreated);

      // Persist data to Hive
      await box.put(boxKey, notifications);

      // Close box and
      await box.close();

      return notifCreated;
    }
    throw NotificationExistException();
  }

  @override
  Future<bool> deleteNotificationPrice(int idNotification) {
    // TODO: implement deleteNotificationPrice
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationPrice>> getNotificationPrice( ) {
    // TODO: implement getNotificationPrice
    throw UnimplementedError();
  }
}
