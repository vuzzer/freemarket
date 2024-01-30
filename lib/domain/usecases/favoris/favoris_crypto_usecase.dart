import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/favoris_crypto.dart';
import 'package:defi/domain/repositories/favoris/favoris_crypto_repo.dart';

class FavorisCryptoUsecase {
  final FavorisCryptoRepo favorisCryptoRepo;
  FavorisCryptoUsecase(this.favorisCryptoRepo);

  Future<Either<Failure, FavorisCrypto>> addCryptoAsFavoris(CryptoInfo crypto) {
    return favorisCryptoRepo.addCryptoAsFavoris(crypto);
  }

  Future<Either<Failure, bool>> removeCryptoFromFavoris(CryptoInfo cryptoInfo) {
    return favorisCryptoRepo.removeCryptoFromFavoris(cryptoInfo);
  }

  Future<Either<Failure, FavorisCrypto>> favorisCryptoList() {
    return favorisCryptoRepo.favorisCryptoList();
  }
}
