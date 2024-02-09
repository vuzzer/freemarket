part of 'market_token_bloc.dart';

@freezed
class MarketTokenState with _$MarketTokenState {
  const factory MarketTokenState(
          {required TokenMarketData? tokenMarketData,
          required bool loading,
          required Either<CryptoError, Success> successOrFailure}) =
      _MarketTokenState;

  factory MarketTokenState.initial() => MarketTokenState(
      loading: true, tokenMarketData: null, successOrFailure: right(Success()));
}

