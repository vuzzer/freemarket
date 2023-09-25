import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/clientp.dart';
import 'package:defi/domain/repositories/clientp/clientp_repository.dart';

class ClientPUsecase {
  final ClientPRepository clientPRepository;
  ClientPUsecase(this.clientPRepository);

  Future<Either<Failure, ClientP>> login() {
    return clientPRepository.login();
  }

  Future<Either<Failure, ClientP>> logout() {
    return clientPRepository.login();
  }
}
