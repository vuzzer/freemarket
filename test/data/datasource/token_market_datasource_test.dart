import 'dart:convert';

import 'package:defi/core/params.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/data/models/token_market_data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'crypto_info_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late Params params;
  late TokenMarketDataModel tokenMarketDataModel;
  final Map<String, dynamic> marketData =
      json.decode(fixture("market_data.json"));
  late TokenMarketDataSourceImpl tokenMarketDataSourceImpl;
  late MockDio mockDio;
  setUpAll(() {
    mockDio = MockDio();
    params = const Params(idToken: "ethereum", currentOfMarket: "usd");
    tokenMarketDataModel = TokenMarketDataModel.fromJson(marketData);
    tokenMarketDataSourceImpl = TokenMarketDataSourceImpl(dio: mockDio);
  });

  // Update local data when executing this text
  test("Should return correct for data interval of 2 for Ethereum", () async {
    // ARRANGE
    when(mockDio.get(any, options: anyNamed("options")))
        .thenAnswer((_) async => Response(data: fixture("market_data.json"), requestOptions: RequestOptions(), statusCode: 200));
    // ASSERT
    final response = await tokenMarketDataSourceImpl.getTokenPrice(params);
    // ACT
    expect(tokenMarketDataModel, response);
  });
}
