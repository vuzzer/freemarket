import 'package:bloc/bloc.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/presentation/blocs/active-notification/active_notification_bloc.dart';
import 'package:defi/service_locator.dart';
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
      }, openNotification: (value) async {
        Map data = Map.from(value.data);
        final index = value.index;
        //! update notificationHistoryBox
        var boxHistoryNotification =
            await Hive.openBox(HiveBoxName.notificationHistoryBox);
        List historyData =
            await boxHistoryNotification.get(data["idNotification"]) ?? [];

        // get notification by date(considered as key)
        final idx = historyData.indexWhere((element) {
          return element['date'] == data['date'];
        });


        // indicate specific notification has been open
        
        historyData[idx]['open'] = true;

        // Update history for specific notification
        boxHistoryNotification.put(data["idNotification"], historyData);

        //! udpate  allNotificationTriggeredBox
        var allNotificationTriggeredBox =
            await Hive.openBox(HiveBoxName.allNotificationTriggeredBox);
        List allNotificationTriggered =
            await allNotificationTriggeredBox.get('all') ?? [];

        // indicate specific notification has been open
        final length = allNotificationTriggered.length - 1;
        data["open"] = true;
        allNotificationTriggered[length - index] = data;
        allNotificationTriggeredBox.put('all', allNotificationTriggered);

        // close Box hive
        await allNotificationTriggeredBox.close();
        await boxHistoryNotification.close();

        // Refresh notification data
        sl<ActiveNotificationBloc>().add(const GetActiveNotification());
        add(const GetAll());
      });
    });
  }
}
