part of 'active_notification_bloc.dart';

@freezed
class ActiveNotificationEvent with _$ActiveNotificationEvent {
  const factory ActiveNotificationEvent.getActiveNotification() =
      GetActiveNotification;
  const factory ActiveNotificationEvent.updateActiveNotification() =
      UpdateActiveNotification;
}
