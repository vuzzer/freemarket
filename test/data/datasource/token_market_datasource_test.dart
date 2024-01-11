import 'dart:convert';

import 'package:defi/core/params.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/data/models/token_market_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  late Params params;
  late TokenMarketDataModel tokenMarketDataModel;
  final Map<String, dynamic> marketData =
      json.decode(fixture("market_data.json"));
  late TokenMarketDataSourceImpl tokenMarketDataSourceImpl;
  setUpAll(() {
    params = const Params(idToken: "ethereum", currentOfMarket: "usd");
    tokenMarketDataModel = TokenMarketDataModel.fromJson(marketData);
    tokenMarketDataSourceImpl = TokenMarketDataSourceImpl();
  });

  test("Should return daily data of Ethereum", () async {
    // ASSERT
    final response = await tokenMarketDataSourceImpl.getTokenPrice(params);
    // ACT
    expect(tokenMarketDataModel, response);
  });
}
