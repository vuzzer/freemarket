import 'package:defi/domain/entities/crypto.dart';
import 'package:equatable/equatable.dart';

class FavorisCrypto extends Equatable {
  final CryptoInfo favoris; // Favoris crypto of user

  const FavorisCrypto(this.favoris);

  @override
  List<Object?> get props => [favoris]; // List of crypto that we want notify
}
