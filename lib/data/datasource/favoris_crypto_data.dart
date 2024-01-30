import 'package:defi/data/models/favoris_crypto_model.dart';
import 'package:defi/domain/entities/crypto.dart';

abstract class FavorisCryptoData {
  FavorisCryptoModel addCryptoAsFavoris(CryptoInfo crypto);
  FavorisCryptoModel getCryptoFavoris();
  bool removeCryptoFromFavoris(CryptoInfo cryptoInfo);
}

class FavorisCryptoDataImpl implements FavorisCryptoData {
  static FavorisCryptoModel favorisCryptoModel = const FavorisCryptoModel();

  @override
  FavorisCryptoModel addCryptoAsFavoris(CryptoInfo crypto) {
    favorisCryptoModel.favoris[crypto.id] = crypto;
    return favorisCryptoModel;
  }

  @override
  FavorisCryptoModel getCryptoFavoris() {
    return favorisCryptoModel;
  }

  @override
  bool removeCryptoFromFavoris(CryptoInfo crypto) {
    if (favorisCryptoModel.favoris.containsKey(crypto.id)) {
      favorisCryptoModel.favoris
          .removeWhere((key, value) => value.id == crypto.id);
      return true;
    }
    return false;
  }
}
