part of 'notification_triggered_bloc.dart';

@freezed
class NotificationTriggeredEvent with _$NotificationTriggeredEvent {
  const factory NotificationTriggeredEvent.getAll() = GetAll;
  const factory NotificationTriggeredEvent.openNotification(Map data, int index) = OpenNotification;
}