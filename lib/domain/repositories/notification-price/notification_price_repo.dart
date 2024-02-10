import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_price.dart';

abstract class NotificationPriceRepo {
  Future<Either<Failure, NotificationPrice>> createNotificationPrice();
  Future<Either<Failure, bool>> deleteNotificationPrice(
      int idNotification);
  Future<Either<Failure, NotificationPrice>> getNotificationPrice(
      int idNotification);
}
