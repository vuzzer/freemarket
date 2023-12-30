import 'package:dartz/dartz.dart';
import 'package:defi/domain/entities/clientProfil.dart';
import 'package:defi/domain/repositories/clientProfil/clientProfil_repository.dart';
import 'package:defi/domain/usecases/clientProfil/clientProfil_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clientProfil_usecase_test.mocks.dart';

@GenerateMocks([ClientProfilRepository])
void main() {
  late MockClientProfilRepository mockClientPRepository;
  late ClientProfilUsecase clientPUsecase;
  late ClientProfil clientP;
  setUp(() {
    mockClientPRepository = MockClientProfilRepository();
    clientPUsecase = ClientProfilUsecase(mockClientPRepository);
    clientP = const ClientProfil(
        email: "",
        uid: "",
        username: "",
        mnemonic: "",
        privateKey: "",
        address: "");
  });

  test("Should return a clientProfil when an user is connected", () async {
    //Arrange
    when(mockClientPRepository.login()).thenAnswer((_) async => Right(clientP));
    //Act
    final result = await clientPUsecase.login();
    //Assert
    expect(result, equals(right(clientP)));
  });

  test("Should return a clientProfil when an user is registered", () async {
    //Arrange
    when(mockClientPRepository.login()).thenAnswer((_) async => Right(clientP));
    //Act
    final result = await clientPUsecase.register();
    //Assert
    expect(result, equals(right(clientP)));
  });

}
