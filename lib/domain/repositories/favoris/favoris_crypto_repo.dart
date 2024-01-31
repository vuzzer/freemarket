import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/favoris_crypto.dart';

abstract class FavorisCryptoRepo {
  Future<Either<Failure, Map<String, CryptoInfo>>> addCryptoAsFavoris(CryptoInfo crypto);
  Future<Either<Failure, bool>> removeCryptoFromFavoris(CryptoInfo cryptoInfo);
  Future<Either<Failure, FavorisCrypto>> favorisCryptoList();
}
