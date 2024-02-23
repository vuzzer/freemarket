import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_crypto.dart';

abstract class NotificationPriceRepo {
  Future<Either<Failure, NotificationCrypto>> createNotificationPrice(
      NotificationCrypto createdNotif);
  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification);
  Future<Either<Failure, List<NotificationCrypto>>> getNotificationPrice(
      String cryptoId);
  Future<Either<Failure, bool>> updateNotification(
      NotificationCrypto updateNotification);
  Future<Either<Failure, bool>> createNotificationFromList(
      List<NotificationCrypto> createNotification);
  Future<Either<Failure, bool>> allDailyNotificationIsCreated(String cryptoId);
}
