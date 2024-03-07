part of 'active_notification_bloc.dart';

@freezed
class ActiveNotificationEvent with _$ActiveNotificationEvent {
  const factory ActiveNotificationEvent.started() = _Started;
}