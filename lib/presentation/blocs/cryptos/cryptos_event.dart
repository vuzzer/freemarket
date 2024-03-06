part of 'cryptos_bloc.dart';

@freezed
class CryptosEvent with _$CryptosEvent {
  const factory CryptosEvent.getCryptoInfo() = GetCryptoInfo;
  const factory CryptosEvent.updateCryptoInfo() = UpdateCryptoInfo;
}
