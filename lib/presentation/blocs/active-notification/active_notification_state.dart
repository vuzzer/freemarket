part of 'active_notification_bloc.dart';

@freezed
class ActiveNotificationState with _$ActiveNotificationState {
  const factory ActiveNotificationState({required int activeNotification}) =
      _ActiveNotificationState;
  factory ActiveNotificationState.initial() =>
      const ActiveNotificationState(activeNotification: 0);
}
