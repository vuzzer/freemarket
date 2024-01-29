import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/favoris_crypto.dart';

class FavorisCryptoModel extends FavorisCrypto {
  const FavorisCryptoModel({super.favoris = const {}});

  CryptoInfo addCrypto(CryptoInfo crypto) {
    favoris[crypto.id] = crypto;
    return crypto;
  }

  bool removeCrypto(CryptoInfo crypto) {
    if (favoris.containsKey(crypto.id)) {
      favoris.removeWhere((key, value) => value.id == crypto.id);
      return true;
    }
    return false;
  }

  List<CryptoInfo> getFavorisCrypto() {
    if (favoris.isNotEmpty) {
      return favoris.entries.map((crypto) => crypto.value).toList();
    }
    return [];
  }
}
