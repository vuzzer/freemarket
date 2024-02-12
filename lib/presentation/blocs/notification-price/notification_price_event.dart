part of 'notification_price_bloc.dart';

@freezed
class NotificationPriceEvent with _$NotificationPriceEvent {
  const factory NotificationPriceEvent.createNotificationPrice(
      {required String cryptoId,
      required double price,
      required int idNotification}) = CreateNotificationPrice;
  const factory NotificationPriceEvent.deleteNotificationPrice(
      int idNotification) = DeleteNotificationPrice;
  const factory NotificationPriceEvent.getNotificationPrice() =
      GetNotificationPrice;
}
