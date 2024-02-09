import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PrimaryCryptoData {
  Future<CryptoInfo> changePrimaryCrypto(CryptoInfo crypto);
  Future<bool> removePrimaryCrypto(CryptoInfo crypto);
  Future<CryptoInfo> getPrimaryCrypto();
}

class PrimaryCryptoDataImpl implements PrimaryCryptoData {
  static String boxFavoris = "primaryCryptoBox";
  static String boxKey = "crypto";

  @override
  Future<CryptoInfo> changePrimaryCrypto(CryptoInfo crypto) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      String primaryCrypto = await box.get(boxKey) ?? "";

      // Check existence of crypto and added to favoris box
      if (primaryCrypto == crypto.id) {
        // Close box opened
        await box.close();

        // Throw exception that indicate primary crypto already exists
        throw PrimaryCryptoExistException();
      }

      // Change primary crypto
      await box.put(boxKey, crypto.id);

      // Close box and
      await box.close();

      return crypto;
    } catch (e) {
      // throw exception in case something happen
      throw ChangePrimaryCryptoException();
    }
  }

  @override
  Future<CryptoInfo> getPrimaryCrypto() async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get state from CryptoBloc
      final cryptoList = sl<CryptosBloc>();

      // Get list of favoris
      String primaryCrypto = await box.get(boxKey) ?? "";

      // Close box and
      await box.close();

      // Convert List<CryptoInfo> to Map<CryptoInfo>
      final mapCrypto = {
        for (var crypto in cryptoList.state.cryptos) crypto.id: crypto
      };

      // If not primary crypto is not set, the first crypto returned as primary
      if (primaryCrypto.isEmpty) {
        return cryptoList.state.cryptos[0];
      }
      return mapCrypto[primaryCrypto] as CryptoInfo;
    } catch (e) {
      // throw exception in case something happen
      throw GetPrimaryException();
    }
  }
  
  @override
  Future<bool> removePrimaryCrypto(CryptoInfo crypto) async {
    try {
      // Open Box favoris
      var box = await Hive.openLazyBox(boxFavoris);

      // Get list of favoris
      String primaryCrypto = await box.get(boxKey) ?? "";

      // delete crypto from favoris
      primaryCrypto = "";

      // update box of favoris
       await box.put(boxKey, primaryCrypto);

      // Close box and
      await box.close();

      // True if primaryCrypto deleted is successful
      return true;

    } catch (e) {
      // throw exception in case something happen
      throw RemovePrimaryCryptoException();
    }
  }
}
