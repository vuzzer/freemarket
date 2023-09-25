import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import '../../entities/clientp.dart';


abstract class ClientPRepository {
  Future<Either<Failure, ClientP>> login();
  Future<Either<Failure, void>> logout(String mnemonic);
}
