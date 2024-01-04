import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import '../../entities/client_profil.dart';


abstract class ClientProfilRepository {
  // Login directly a client
  Future<Either<Failure, ClientProfil>> login();

  // Register a client
  Future<Either<Failure, ClientProfil>> register();

  // Log out a client
  Future<Either<Failure, bool>> logout();
}
