part of 'cryptos_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState(
      {required bool loading,
      required List<CryptoInfo> cryptos,
      required Either<CryptoError, Success> successOrFailure}) = _CryptoState;
  factory CryptoState.initial() => CryptoState(
      cryptos: [], successOrFailure: right(Success()), loading: false);
}

