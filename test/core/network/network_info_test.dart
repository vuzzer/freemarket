import 'package:defi/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkInfoImpl networkInfoImpl;
  setUpAll(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(InternetConnectionChecker());
  });

  test("Should listen connectivity", () async {
    // ARRANGE
    /*  when(mockInternetConnectionChecker.onStatusChange).thenAnswer((_) =>
        Stream<InternetConnectionStatus>.fromIterable(
            [InternetConnectionStatus.connected])); */
    // ACT

    // ASSERT
  });
}
