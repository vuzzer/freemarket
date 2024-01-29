import 'package:defi/core/base_url.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/data/models/crypto_info_model.dart';
import 'package:dio/dio.dart';

abstract class CryptoInfoSource {
  /// Throws [Error]
  Future<List<CryptoInfoModel>> getCryptoInfo();
}

class CryptoInfoSourceImpl implements CryptoInfoSource {
  final Dio dio; //Http Requester
  CryptoInfoSourceImpl(this.dio);
  @override
  Future<List<CryptoInfoModel>> getCryptoInfo() async {
    final options = Options(
        contentType: "application/json",
        sendTimeout: const Duration(seconds: 3),
        headers: {"Content-Type": "Application/json"});

    final response = await dio.get(
        "${baseUrl}coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false&locale=fr&precision=2",
        options: options);

    if (response.statusCode == 200) {
      // List of market crypto
      final List<dynamic> data = response.data;
      // Convert data to model
      List<CryptoInfoModel> cryptos = data.map((crypto) {
        return CryptoInfoModel.fromJson(crypto);
      }).toList();
      // List of crypto
      return cryptos;
    }
    throw NetworkException();
  }
}
