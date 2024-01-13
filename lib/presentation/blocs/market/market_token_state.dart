part of 'market_token_bloc.dart';

class MarketTokenState extends Equatable {
  const MarketTokenState();

  @override
  List<Object> get props => [];
}

class MarketTokenEmpty extends MarketTokenState {}

class MarketTokenLoading extends MarketTokenState {}

class MarketTokenLoaded extends MarketTokenState {
  final TokenMarketData tokenMarketData;
  const MarketTokenLoaded(this.tokenMarketData);
}

class MarketTokenError extends MarketTokenState {
  final String message;
  const MarketTokenError(this.message);
}
