import 'package:defi/domain/entities/crypto.dart';

abstract class FavorisCryptoData {
  Map<String, CryptoInfo> addCryptoAsFavoris(CryptoInfo crypto);
  //bool removeCryptoFromFavoris(CryptoInfo cryptoInfo);
}

class FavorisCryptoDataImpl implements FavorisCryptoData {
  static Map<String, CryptoInfo> favorisList = {};

  @override
  Map<String, CryptoInfo> addCryptoAsFavoris(CryptoInfo crypto) {
    favorisList[crypto.id] = crypto;
    return favorisList;
  }
}
