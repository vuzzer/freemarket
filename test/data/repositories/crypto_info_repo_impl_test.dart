import 'package:defi/data/datasource/crypto_info_source.dart';
import 'package:defi/data/repositories/crypto_info_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'crypto_info_repo_impl_test.mocks.dart';

@GenerateMocks([CryptoInfoSource])
void main() {
  late CryptoInfoRepoImpl cryptoInfoSourceImpl;
  late MockCryptoInfoSource mockCryptoInfoSource;

  setUpAll(() {
    mockCryptoInfoSource = MockCryptoInfoSource();
    cryptoInfoSourceImpl = CryptoInfoRepoImpl(mockCryptoInfoSource);
    
  });

  test("Should return crypto info list", () async {
    //when(mockCryptoInfoSource.getCryptoInfo()).thenAnswer((_) =>  )
  });
}
