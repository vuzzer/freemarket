import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/favoris_crypto_data.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/favoris_crypto.dart';
import 'package:defi/domain/repositories/favoris/favoris_crypto_repo.dart';

class FavorisCryptoRepoImpl implements FavorisCryptoRepo {
  final FavorisCryptoData favorisCryptoData;

  FavorisCryptoRepoImpl(this.favorisCryptoData);

  @override
  Future<Either<Failure, Map<String, CryptoInfo>>> addCryptoAsFavoris(
      CryptoInfo crypto) {
    try {
      final favorisCrypto = favorisCryptoData.addCryptoAsFavoris(crypto);
      return Future.value(Right(favorisCrypto));
    } catch (e) {
      return Future.value(Left(InterneFailure()));
    }
  }

  @override
  Future<Either<Failure, FavorisCrypto>> favorisCryptoList() {
    // TODO: implement favorisCryptoList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> removeCryptoFromFavoris(CryptoInfo crypto) {
    // TODO
    throw UnimplementedError();
    /*   try {
      final removed = favorisCryptoData.removeCryptoFromFavoris(crypto);
      return Future.value(Right(removed));
    } catch (e) {
      return Future.value(Left(InterneFailure()));
    } */
  }
}
