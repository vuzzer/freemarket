import 'package:defi/data/datasource/crypto_info_source.dart';
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
  setUpAll(() {
    mockDio = MockDio();
    cryptoInfoSourceImpl = CryptoInfoSourceImpl(mockDio);
  });

  test("Should return crypto info", () async {
    // arrange
    when(mockDio.get(any))
        .thenAnswer((_) async => Response( data: fixture("crypto_info.json") , requestOptions: RequestOptions(), statusCode: 200 ));
    // act date
    await cryptoInfoSourceImpl.getCryptoInfo();
  });
}
