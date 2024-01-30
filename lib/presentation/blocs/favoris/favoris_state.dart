part of 'favoris_bloc.dart';

class FavorisState extends Equatable {
  final FavorisCrypto favoris;
  const FavorisState({this.favoris = const FavorisCrypto()});

  @override
  List<Object> get props => [];
}

class FavorisInitial extends FavorisState {
  
}
