import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/base_type.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/token_market_data.dart';
import 'package:defi/domain/usecases/market/token_market_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_token_event.dart';
part 'market_token_state.dart';
part 'market_token_bloc.freezed.dart';

class MarketTokenBloc extends Bloc<MarketTokenEvent, MarketTokenState> {
  final TokenMarketUsecase tokenMarketUsecase;

  MarketTokenBloc({required this.tokenMarketUsecase})
      : super(MarketTokenState.initial()) {
    on<MarketTokenEvent>((event, emit) async {
      await event.map(getTokenPrice: (value) async {
        emit(state.copyWith(loading: true));

        // Fetch data token
        final market = await tokenMarketUsecase.getTokenPrice(event.params);

        market.fold((error) => emit(state.copyWith(loading: false, successOrFailure: left(CryptoError("Une erreur s'est produite")) ) ),
            (tokenPrice) => emit(state.copyWith(loading: false, tokenMarketData: tokenPrice, successOrFailure: right(Success()) ) ));
      });
    });
  }
}
