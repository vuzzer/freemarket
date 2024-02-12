import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/base_type.dart';
import 'package:defi/domain/entities/notification_price.dart';
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
          createNotificationPrice: (value) => _createNotificaitonPrice(emit: emit, cryptoId: value.cryptoId, price: value.price, idNotification: value.idNotification ),
          deleteNotificationPrice: (value) {},
          getNotificationPrice: (value) {});
    });
  }

  Future<void> _createNotificaitonPrice(
      {required Emitter<NotificationPriceState> emit,
      required String cryptoId,
      required double price,
      required int idNotification}) async {

    final notificatons = await notificationPriceUsecase.createNotificationPrice(
        cryptoId: cryptoId, price: price, idNotificaton: idNotification);

    // fold
    notificatons.fold(
        (error) => emit(state.copyWith(
            successOrFail: left(CryptoError("Erreur lors du chargement")))),
        (response) {
      add(const NotificationPriceEvent.getNotificationPrice());
    });

  }
  
}
