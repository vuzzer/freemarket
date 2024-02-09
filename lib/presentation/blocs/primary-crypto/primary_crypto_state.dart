part of 'primary_crypto_bloc.dart';

@freezed
class PrimaryCryptoState with _$PrimaryCryptoState {
  const factory PrimaryCryptoState({ 
    required CryptoInfo? crypto,
    required bool loading,
    required Either<CryptoError, Success> successOrFailure
   }) = _PrimaryCrptoState;

   factory PrimaryCryptoState.initial() => PrimaryCryptoState(crypto: null  , loading: true, successOrFailure: right(Success()) )  ;
}
