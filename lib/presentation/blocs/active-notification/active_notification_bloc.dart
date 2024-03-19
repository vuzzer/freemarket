import 'package:bloc/bloc.dart';
import 'package:defi/domain/usecases/active-notification/active_notification_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_notification_event.dart';
part 'active_notification_state.dart';
part 'active_notification_bloc.freezed.dart';

class ActiveNotificationBloc
    extends Bloc<ActiveNotificationEvent, ActiveNotificationState> {
  ActiveNotificationUsecase activeNotificationUsecase;
  ActiveNotificationBloc({required this.activeNotificationUsecase})
      : super(ActiveNotificationState.initial()) {
    on<ActiveNotificationEvent>((event, emit) async {
      await event.map(getActiveNotification: (value) async {
        final result = await activeNotificationUsecase.getActiveNotification();

        result.fold((l) => null,
            (activeNotification) => emit(state.copyWith(activeNotification: activeNotification)) );
      }, updateActiveNotification: (value) async {
        int activeNotification = value.activeNotification;
        final result =
            await activeNotificationUsecase.updateActiveNotification(activeNotification);

        result.fold((l) => null,
            (active) => emit(state.copyWith(activeNotification: active)));
      });
    });
  }
}
