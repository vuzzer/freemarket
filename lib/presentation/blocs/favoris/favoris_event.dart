part of 'favoris_bloc.dart';

sealed class FavorisEvent extends Equatable {
  const FavorisEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorisEvent extends FavorisEvent {}

class AddFavorisEvent extends FavorisEvent {
  final CryptoInfo crypto;
  const AddFavorisEvent(this.crypto);
}

class RemoveFavorisEvent extends FavorisEvent {
  final CryptoInfo crypto;
  const RemoveFavorisEvent(this.crypto);
}

