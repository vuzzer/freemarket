part of 'notification_price_bloc.dart';

@freezed
class NotificationPriceEvent with _$NotificationPriceEvent {
  const factory NotificationPriceEvent.createNotificationPrice(
      NotificationCrypto notification) = CreateNotificationPrice;
  const factory NotificationPriceEvent.updateNotificationPrice(
      NotificationCrypto notification) = UpdateNotificationPrice;
  const factory NotificationPriceEvent.deleteNotificationPrice(
      String cryptoId, int idNotification) = DeleteNotificationPrice;
  const factory NotificationPriceEvent.getNotificationPrice(String cryptoId) =
      GetNotificationPrice;
  const factory NotificationPriceEvent.createNotificationFromList(
      List<NotificationCrypto> createNotification) = CreateNotificationFromList;
}
