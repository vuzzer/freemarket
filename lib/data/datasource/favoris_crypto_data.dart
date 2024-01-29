import 'package:defi/domain/entities/crypto.dart';

abstract class FavorisCryptoData {
  Future<CryptoInfo> addCryptoAsFavoris(CryptoInfo crypto);

  Future<bool> removeCryptoFromFavoris(CryptoInfo cryptoInfo);

  Future<List<CryptoInfo>> favorisCryptoList();
}


class FavorisCryptoDataImpl implements FavorisCryptoData{
  @override
  Future<CryptoInfo> addCryptoAsFavoris(CryptoInfo crypto) {
    // TODO: implement addCryptoAsFavoris
    throw UnimplementedError();
  }

  @override
  Future<List<CryptoInfo>> favorisCryptoList() {
    // TODO: implement favorisCryptoList
    throw UnimplementedError();
  }

  @override
  Future<bool> removeCryptoFromFavoris(CryptoInfo cryptoInfo) {
    // TODO: implement removeCryptoFromFavoris
    throw UnimplementedError();
  }

}