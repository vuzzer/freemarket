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
          createNotificationPrice: (value) => _createNotificaitonPrice(
              emit: emit, createNotif: value.notification),
          deleteNotificationPrice: (value) => _deleteNotification(emit: emit, cryptoId: value.cryptoId, idNotification: value.idNotification),
          getNotificationPrice: (value) =>
              _getNotification(emit: emit, cryptoId: value.cryptoId));
    });
  }

  Future<void> _createNotificaitonPrice(
      {required Emitter<NotificationPriceState> emit,
      required NotificationCrypto createNotif}) async {
    final notificatons =
        await notificationPriceUsecase.createNotificationPrice(createNotif);

    // fold
    notificatons.fold(
        (error) => emit(state.copyWith(
            successOrFail: left(CryptoError("Erreur lors du chargement")))),
        (response) {
      add(NotificationPriceEvent.getNotificationPrice(createNotif.cryptoId));
    });
  }

  Future<void> _getNotification(
      {required Emitter<NotificationPriceState> emit,
      required String cryptoId}) async {
    final notification =
        await notificationPriceUsecase.getNotificationPrice(cryptoId);

    //fold
    notification.fold(
        (e) => emit(state.copyWith(
            successOrFail: left(CryptoError("Erreur lors du chargement")))),
        (listNotif) => emit(state.copyWith(
            notifications: listNotif, successOrFail: right(Success()))));
  }

  Future<void> _deleteNotification(
      {required Emitter<NotificationPriceState> emit,
      required String cryptoId,
      required int idNotification}) async {
    final deleteNotificationPrice =
        await notificationPriceUsecase.deleteNotificationPrice(idNotification);

    // fold
    deleteNotificationPrice.fold(
        (error) => emit(state.copyWith(
            successOrFail: left(CryptoError("Erreur lors du chargement")))),
        (success) => add(
            NotificationPriceEvent.getNotificationPrice(cryptoId)));
  }
}
