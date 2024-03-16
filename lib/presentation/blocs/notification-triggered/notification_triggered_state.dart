part of 'notification_triggered_bloc.dart';



@freezed
class NotificationTriggeredState with _$NotificationTriggeredState {
    const factory NotificationTriggeredState(
      {required List all, required bool loading}) = _NotificationTriggeredState;
   factory NotificationTriggeredState.initial() => const NotificationTriggeredState(all: [], loading: true);
}
