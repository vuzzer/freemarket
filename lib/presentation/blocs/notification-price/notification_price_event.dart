part of 'notification_price_bloc.dart';

@freezed
class NotificationPriceEvent with _$NotificationPriceEvent {
  const factory NotificationPriceEvent.createNotificationPrice(
      NotificationCrypto notification) = CreateNotificationPrice;
  const factory NotificationPriceEvent.deleteNotificationPrice(
      int idNotification) = DeleteNotificationPrice;
  const factory NotificationPriceEvent.getNotificationPrice(String cryptoId) =
      GetNotificationPrice;
}
