import 'package:dartz/dartz.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'favoris_state.freezed.dart';


@freezed
class FavorisState with _$FavorisState {
  const factory FavorisState(
      {required Map<String, CryptoInfo> favoris,
      required Either<String, bool> successOrfail}) = _FavorisState;

  factory FavorisState.initial() =>
      FavorisState(favoris: {}, successOrfail: right(true));
}

/* sealed class FavorisState extends Equatable {
  final Map<String, CryptoInfo> favoris = {};

  @override
  List<Object> get props => [];
}

class FavorisInitial extends FavorisState {}

class FavorisAdded extends FavorisState {
  FavorisAdded({required favoris});
}

class FavorisError extends FavorisState {
  final String message;
  FavorisError(this.message);
} */
