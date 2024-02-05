import 'package:defi/core/error/exception.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PrimaryCryptoData {
  Future<CryptoInfo> changePrimaryCrypto(CryptoInfo info);
  Future<CryptoInfo> getPrimaryCrypto();
}

class PrimaryCryptoDataImpl implements PrimaryCryptoData {
  static String boxFavoris = "primaryCryptoBox";
  static String boxKey = "crypto";

  @override
  Future<CryptoInfo> changePrimaryCrypto(CryptoInfo info) async {
    // TODO: implement getPrimaryCrypto
    throw UnimplementedError();
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
}
