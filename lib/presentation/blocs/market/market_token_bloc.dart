import 'package:bloc/bloc.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/token_market_data.dart';
import 'package:defi/domain/usecases/market/token_market_usecase.dart';
import 'package:equatable/equatable.dart';

part 'market_token_event.dart';
part 'market_token_state.dart';

class MarketTokenBloc extends Bloc<MarketTokenEvent, MarketTokenState> {
  final TokenMarketUsecase tokenMarketUsecase;

  MarketTokenBloc({required this.tokenMarketUsecase})
      : super(MarketTokenEmpty()) {
    on<MarketTokenEvent>((event, emit) async {
      if (event is GetTokenPrice) {
        // Emit Loading state when fetching data
        emit(MarketTokenLoading());

                // Fetch data token
        final market = await tokenMarketUsecase.getTokenPrice(event.params);
        
        await Future.delayed(const Duration(seconds: 5)).whenComplete(() =>
            market.fold(
                (error) => emit(const MarketTokenError("Error of loading")),
                (tokenPrice) => emit(MarketTokenLoaded(tokenPrice))));

      }
    });
  }
}
