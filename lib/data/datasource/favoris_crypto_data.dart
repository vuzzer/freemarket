import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:hive/hive.dart';

abstract class FavorisCryptoData {
  Future<Map<String, CryptoInfo>> addCryptoAsFavoris(CryptoInfo crypto);
  Future<Map<String, CryptoInfo>> getCryptoFavoris();
  Future<Map<String, CryptoInfo>> removeCryptoFromFavoris(
      CryptoInfo cryptoInfo);
}

class FavorisCryptoDataImpl implements FavorisCryptoData {
  static String boxFavoris = "favorisBox";
  static String boxKey = "favoris";

  @override
  Future<Map<String, CryptoInfo>> getCryptoFavoris() async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get state from CryptoBloc
      final cryptoList = sl<CryptosBloc>();

      // Get list of favoris
      var favoris = await box.get(boxKey) ?? [];

      // Convert List<CryptoInfo> to Map<CryptoInfo>
      final mapCrypto = {
        for (var crypto in cryptoList.state.cryptos) crypto.id: crypto
      };

      // Get all favoris from state of CryptoBloc
      Map<String, CryptoInfo> favorisList = {};
      for (int i = 0; i < favoris.length; i++) {
        if (mapCrypto.containsKey(favoris[i])) {
          favorisList[favoris[i]] = mapCrypto[favoris[i]]!;
        }
      }
      // Close box and
      await box.close();

      return favorisList;
    } catch (e) {
      // throw exception in case something happen
      throw LoadFavorisException();
    }
  }

  @override
  Future<Map<String, CryptoInfo>> addCryptoAsFavoris(CryptoInfo crypto) async {
    // Open Box favoris
    var box = await Hive.openLazyBox(boxFavoris);

    // Get state from CryptoBloc
    final cryptoList = sl<CryptosBloc>();

    // Get list of favoris
    var favoris = await box.get(boxKey) ?? [];

    // Check existence of crypto and added to favoris box
    if (favoris.contains(crypto.id)) {
      // Close box opened
      await box.close();

      // Throw exception that indicate favoris already exists
      throw FavorisExistException();
    }

    try {
      // Add new favoris to box
      favoris.add(crypto.id);
      await box.put(boxKey, favoris);

      // Convert List<CryptoInfo> to Map<CryptoInfo>
      final mapCrypto = {
        for (var crypto in cryptoList.state.cryptos) crypto.id: crypto
      };

      // Get all favoris from state of CryptoBloc
      Map<String, CryptoInfo> favorisList = {};
      for (int i = 0; i < favoris.length; i++) {
        if (mapCrypto.containsKey(favoris[i])) {
          favorisList[favoris[i]] = mapCrypto[favoris[i]]!;
        }
      }
      // Close box and
      await box.close();

      //return list of favoris crypto
      return favorisList;
    } catch (e) {
      // Close box
      await box.close();

      // Throw exception indicate exception during adding
      throw AddFavorisException();
    }
  }

  @override
  Future<Map<String, CryptoInfo>> removeCryptoFromFavoris(
      CryptoInfo cryptoInfo) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get state from CryptoBloc
      final cryptoList = sl<CryptosBloc>();

      // Get list of favoris
      List favoris = await box.get(boxKey) ?? [];

      // delete crypto from favoris
      favoris.removeWhere((id) => id == cryptoInfo.id);

      // update box of favoris
      await box.put(boxKey, favoris);

      // Convert List<CryptoInfo> to Map<CryptoInfo>
      final mapCrypto = {
        for (var crypto in cryptoList.state.cryptos) crypto.id: crypto
      };

      // Get all favoris from state of CryptoBloc
      Map<String, CryptoInfo> favorisList = {};
      for (int i = 0; i < favoris.length; i++) {
        if (mapCrypto.containsKey(favoris[i])) {
          favorisList[favoris[i]] = mapCrypto[favoris[i]]!;
        }
      }
      // Close box and
      await box.close();

      return favorisList;
    } catch (e) {
      // throw exception in case something happen
      throw RemoveFavorisException();
    }
  }
}
