import 'dart:convert';

import 'package:defi/core/error/exception.dart';
import 'package:defi/data/datasource/crypto_info_source.dart';
import 'package:defi/data/models/crypto_info_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import 'crypto_info_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late CryptoInfoSourceImpl cryptoInfoSourceImpl;
  late MockDio mockDio;
  late List cryptoData;

  setUpAll(() {
    mockDio = MockDio();
    cryptoInfoSourceImpl = CryptoInfoSourceImpl(mockDio);
    cryptoData = json.decode(fixture("crypto_info.json"));
  });

  group('connected', () {
    test("Should return crypto info list", () async {
      //! ARRANGE
      when(mockDio.get(any, options: anyNamed("options"))).thenAnswer(
          (_) async => Response(
              data: cryptoData,
              requestOptions: RequestOptions(),
              statusCode: 200));
      //! ASSERT
      final result = await cryptoInfoSourceImpl.getCryptoInfo();
      expect(result, isA<List<CryptoInfoModel>>());
    });

    test("Should return NetworkException when status is not 200", () async {
      //! ARRANGE
      when(mockDio.get(any, options: anyNamed("options"))).thenAnswer(
          (_) async =>
              Response(requestOptions: RequestOptions(), statusCode: 429));
      //! ACT
      final call = cryptoInfoSourceImpl.getCryptoInfo;
      //! ASSERT
      expect(() => call(), throwsA(const TypeMatcher<NetworkException>()));
    });
  });

  
}
