import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';


abstract class FavorisCryptoRepo {
  Future<Either<Failure, Map<String, CryptoInfo>>> addCryptoAsFavoris(CryptoInfo crypto);
  Future<Either<Failure, Map<String, CryptoInfo>>> removeCryptoFromFavoris(CryptoInfo cryptoInfo);
  Future<Either<Failure, Map<String, CryptoInfo>>> favorisCryptoList();
}
