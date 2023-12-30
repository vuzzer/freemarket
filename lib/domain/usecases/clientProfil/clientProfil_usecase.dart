import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/clientProfil.dart';
import 'package:defi/domain/repositories/clientProfil/clientProfil_repository.dart';

class ClientProfilUsecase {
  final ClientProfilRepository clientProfilRepository;
  ClientProfilUsecase(this.clientProfilRepository);

  Future<Either<Failure, ClientProfil>> login() {
    return clientProfilRepository.login();
  }

  Future<Either<Failure, void>> logout() {
    return clientProfilRepository.login();
  }

    Future<Either<Failure, void>> register() {
    return clientProfilRepository.register();
  }
}
