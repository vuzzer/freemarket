import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_notification_event.dart';
part 'active_notification_state.dart';
part 'active_notification_bloc.freezed.dart';

class ActiveNotificationBloc extends Bloc<ActiveNotificationEvent, ActiveNotificationState> {
  ActiveNotificationBloc() : super(_Initial()) {
    on<ActiveNotificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
