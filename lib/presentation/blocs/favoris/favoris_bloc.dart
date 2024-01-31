import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/usecases/favoris/favoris_crypto_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

part 'favoris_event.dart';
part 'favoris_bloc.freezed.dart';

class FavorisBloc extends Bloc<FavorisEvent, FavorisState> {
  final FavorisCryptoUsecase favorisCryptoUsecase;
  FavorisBloc({required this.favorisCryptoUsecase})
      : super(FavorisState.initial()) {
    on<FavorisEvent>((event, emit) async {
      switch (event) {
        case AddFavorisEvent():
          final favoris =
              await favorisCryptoUsecase.addCryptoAsFavoris(event.crypto);
          favoris.fold((e) {
            //print(e);
            //emit(FavorisError("Error occured"));
            emit(state.copyWith(successOrfail: left("Error occured")));
          }, (crypto) {
            //Logger().d(crypto);
            var newState = Map<String, CryptoInfo>.from(crypto);
            emit(state
                .copyWith(favoris: newState ,  successOrfail: right(true)));
            //emit(FavorisAdded(favoris: crypto));
          });
          break;
        case RemoveFavorisEvent():
          break;
      }
    });
  }
}

@freezed
class FavorisState with _$FavorisState {
  const factory FavorisState(
      {required Map<String, CryptoInfo> favoris,
      required Either<String, bool> successOrfail}) = _FavorisState;

  factory FavorisState.initial() =>
      FavorisState(favoris: {}, successOrfail: right(true));
}
