part of 'market_token_bloc.dart';

class MarketTokenEvent extends Equatable {
  const MarketTokenEvent();

  @override
  List<Object> get props => [];
}

class GetTokenPrice extends MarketTokenEvent {
  final Params params;
  const GetTokenPrice(this.params);
}
