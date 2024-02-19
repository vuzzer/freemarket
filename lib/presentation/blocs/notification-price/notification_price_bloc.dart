import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/domain/usecases/notification-price/notification_price_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_price_event.dart';
part 'notification_price_state.dart';
part 'notification_price_bloc.freezed.dart';

class NotificationPriceBloc
    extends Bloc<NotificationPriceEvent, NotificationPriceState> {
  NotificationPriceUsecase notificationPriceUsecase;
  NotificationPriceBloc({required this.notificationPriceUsecase})
      : super(NotificationPriceState.initial()) {
    on<NotificationPriceEvent>((event, emit) async {
      await event.map(
          createNotificationPrice: (value) => _createNotificaitonPrice(emit: emit, createNotif: value.notification ),
          deleteNotificationPrice: (value) {},
          getNotificationPrice: (value) {});
    });
  }

  Future<void> _createNotificaitonPrice(
      {required Emitter<NotificationPriceState> emit,
      required NotificationCrypto createNotif}) async {

    final notificatons = await notificationPriceUsecase.createNotificationPrice(
        createNotif);

    // fold
    notificatons.fold(
        (error) => emit(state.copyWith(
            successOrFail: left(CryptoError("Erreur lors du chargement")))),
        (response) {
      add(const NotificationPriceEvent.getNotificationPrice());
    });

  }

}
