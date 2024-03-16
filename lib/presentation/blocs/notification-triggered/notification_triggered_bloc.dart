import 'package:bloc/bloc.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'notification_triggered_event.dart';
part 'notification_triggered_state.dart';
part 'notification_triggered_bloc.freezed.dart';

class NotificationTriggeredBloc
    extends Bloc<NotificationTriggeredEvent, NotificationTriggeredState> {
  NotificationTriggeredBloc() : super(NotificationTriggeredState.initial()) {
    on<NotificationTriggeredEvent>((event, emit) async {
      await event.map(getAll: (value) async {
        // Open box that hold all notification triggered
        var allNotificationTriggeredBox =
            await Hive.openBox(HiveBoxName.allNotificationTriggeredBox);
        List allNotificationTriggered =
            await allNotificationTriggeredBox.get('all') ?? [];

        final newData = List.from(allNotificationTriggered.reversed);

        await allNotificationTriggeredBox.close();

        emit(state.copyWith(all: newData, loading: false));
      });
    });
  }
}
