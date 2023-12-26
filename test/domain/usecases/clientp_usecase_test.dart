import 'package:dartz/dartz.dart';
import 'package:defi/domain/entities/clientp.dart';
import 'package:defi/domain/repositories/clientp/clientp_repository.dart';
import 'package:defi/domain/usecases/clientp/clientp_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clientp_usecase_test.mocks.dart';

@GenerateMocks([ClientPRepository])
void main() {
  late MockClientPRepository mockClientPRepository;
  late ClientPUsecase clientPUsecase;
  late ClientP clientP;
  setUp(() {
    mockClientPRepository = MockClientPRepository();
    clientPUsecase = ClientPUsecase(mockClientPRepository);
    clientP = const ClientP(
        email: "",
        uid: "",
        username: "",
        mnemonic: "",
        privateKey: "",
        address: "");
  });

  test("Should return a clientP when an user is connected", () async {
    //Arrange
    when(mockClientPRepository.login()).thenAnswer((_) async => Right(clientP));
    //Act
    final result = await clientPUsecase.login();
    //Assert
    expect(result, equals(right(clientP)));
  });
}
