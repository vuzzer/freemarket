part of 'market_token_bloc.dart';

@freezed
class MarketTokenEvent with _$MarketTokenEvent {
  const factory MarketTokenEvent.getTokenPrice(Params params) = GetTokenPrice;
}

