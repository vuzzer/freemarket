import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/client_profil_source.dart';
import 'package:defi/domain/entities/client_profil.dart';
import 'package:defi/domain/repositories/clientProfil/clientProfil_repository.dart';

class ClientProfilRepositoryImpl implements ClientProfilRepository {
  final ClientProfilDataSource clientProfilDataSource;

  ClientProfilRepositoryImpl(this.clientProfilDataSource);

  @override
  Future<Either<Failure, ClientProfil>> login() async {
    try {
      final user = await clientProfilDataSource.login();
      return Future.value(Right(user));
    } on FailedLoginException {
      return Left(FailedLoginFailure());
    } on UserNotExistException{
      return Left(UserNotExistFaillure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ClientProfil>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
