import 'dart:convert';

import 'package:defi/core/base_url.dart';
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
        headers: {
          "cache-control": "max-age=30,public,must-revalidate,s-maxage=30"
        });

    final response = await dio.get(
        "${baseUrl}coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&locale=fr&precision=2");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.data);
      print(data);
    }
    throw UnimplementedError();
  }
}
