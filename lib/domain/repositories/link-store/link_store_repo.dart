import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';

abstract class LinkStoreRepo {
  Future<Either< Failure, String>> getLinkStoreToShare();
}
