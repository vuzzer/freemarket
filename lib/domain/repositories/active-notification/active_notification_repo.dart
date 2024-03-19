import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';

abstract class ActiveNotificationRepo {
  Future<Either<Failure, int>> getActiveNotification();
  Future<Either<Failure, int>> updateActiveNotification(int activeNotification);
}
