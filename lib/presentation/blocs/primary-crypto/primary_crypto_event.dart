part of 'primary_crypto_bloc.dart';

@freezed
class PrimaryCryptoEvent with _$PrimaryCryptoEvent {
  const factory PrimaryCryptoEvent.getPrimaryCrypto() = GetPrimaryCrypto;
  const factory PrimaryCryptoEvent.changePrimaryCrypto(CryptoInfo crypto) = ChangePrimaryCrypto;
    const factory PrimaryCryptoEvent.removePrimaryCrypto(CryptoInfo crypto) = RemovePrimaryCrypto;
}
