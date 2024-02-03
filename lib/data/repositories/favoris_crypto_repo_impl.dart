import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/favoris_crypto_data.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/repositories/favoris/favoris_crypto_repo.dart';


class FavorisCryptoRepoImpl implements FavorisCryptoRepo {
  final FavorisCryptoData favorisCryptoData;

  FavorisCryptoRepoImpl(this.favorisCryptoData);

  @override
  Future<Either<Failure, Map<String, CryptoInfo>>> addCryptoAsFavoris(
      CryptoInfo crypto) async {
    try {
      final favorisCrypto = await favorisCryptoData.addCryptoAsFavoris(crypto);
      return Right(favorisCrypto);
    } catch (e) {
      return Future.value(Left(InterneFailure()));
    }
  }

  @override
  Future<Either<Failure, Map<String, CryptoInfo>>> favorisCryptoList() async {
    try {
      final favoris = await favorisCryptoData.getCryptoFavoris();
      return right(favoris);
    } on LoadFavorisException {
      return left(LoadFavorisFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, CryptoInfo>>> removeCryptoFromFavoris(CryptoInfo crypto) async {
     try {
      final favoris = await favorisCryptoData.removeCryptoFromFavoris(crypto);
      return Right(favoris);
    } on RemoveFavorisException {
      return Future.value(Left(InterneFailure()));
    } 
  }
}
