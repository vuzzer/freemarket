import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_price.dart';

abstract class NotificationPriceRepo {
  Future<Either<Failure, NotificationPrice>> createNotificationPrice({required String cryptoId,required double price, required int idNotificaton });
  Future<Either<Failure, bool>> deleteNotificationPrice(
      int idNotification);
  Future<Either<Failure, List<NotificationPrice>>> getNotificationPrice(
     );
}
