import 'dart:io';

import 'package:defi/core/error/exception.dart';
import 'package:defi/core/params.dart';
import 'package:defi/data/models/token_market_data_model.dart';
import 'package:dio/dio.dart';

abstract class TokenMarketDataSource {
  /// Throws [NetworkException]
  Future<TokenMarketDataModel> getTokenPrice(Params params);
}

class TokenMarketDataSourceImpl implements TokenMarketDataSource {
  final dio = Dio();
  @override
  Future<TokenMarketDataModel> getTokenPrice(Params params) async {
    final options = Options(contentType: "application/json", headers: {
      "cache-control": "max-age=30,public,must-revalidate,s-maxage=30"
    });

    final response = await dio.get(
        "https://api.coingecko.com/api/v3/coins/${params.idToken}/market_chart?vs_currency=${params.currentOfMarket}&days=1&interval=daily&precision=2&interval=daily",
        options: options);

    if (response.statusCode == 200) {
      return TokenMarketDataModel.fromJson(response.data);
    }

    throw NetworkException();
  }
}
