part of 'notification_price_bloc.dart';

@freezed
class NotificationPriceState with _$NotificationPriceState {
  const factory NotificationPriceState(
      {required bool loading, required List<NotificationCrypto> notifications,
      required Either<CryptoError, Success> successOrFail}) = _NotificationPriceState;
   factory NotificationPriceState.initial(
   ) => NotificationPriceState(notifications: [], successOrFail: Right(Success()), loading: false ) ;
}
