import 'package:defi/core/base_url.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/params.dart';
import 'package:defi/data/models/token_market_data_model.dart';
import 'package:dio/dio.dart';

abstract class TokenMarketDataSource {
  /// Throws [NetworkException]
  Future<TokenMarketDataModel> getTokenPrice(Params params);
}

class TokenMarketDataSourceImpl implements TokenMarketDataSource {
  final Dio dio;

  TokenMarketDataSourceImpl({required this.dio});

  @override
  Future<TokenMarketDataModel> getTokenPrice(Params params) async {
    final options = Options(
        contentType: "application/json",
        sendTimeout: const Duration(seconds: 3),
        headers: {
          "cache-control": "max-age=30,public,must-revalidate,s-maxage=30"
        });

    try {
      // Fetch daily data token
      final response = await dio.get(
          "${baseUrl}coins/${params.idToken}/market_chart?vs_currency=${params.currentOfMarket}&days=${params.periode}&precision=${params.decimalOfPrice}",
          options: options);

      // Succes request so get data
      if (response.statusCode == 200) {
        final data = response.data;
        return TokenMarketDataModel.fromJson(data);
      }

      throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }
}
