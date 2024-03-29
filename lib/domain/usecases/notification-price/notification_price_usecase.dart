import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/domain/repositories/notification-crypto/notification_price_repo.dart';

class NotificationPriceUsecase {
  final NotificationPriceRepo notificationPriceRepo;
  NotificationPriceUsecase(this.notificationPriceRepo);

  Future<Either<Failure, NotificationCrypto>> createNotificationPrice(
      NotificationCrypto createNotif) {
    return notificationPriceRepo.createNotificationPrice(createNotif);
  }

  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification) {
    return notificationPriceRepo.deleteNotificationPrice(idNotification);
  }

  Future<Either<Failure, List<NotificationCrypto>>> getNotificationPrice(
      String cryptoId) {
    return notificationPriceRepo.getNotificationPrice(cryptoId);
  }

  Future<Either<Failure, bool>> updateNotification(
      NotificationCrypto updateNotification) {
    return notificationPriceRepo.updateNotification(updateNotification);
  }

  Future<Either<Failure, bool>> createNotificationFromList(
      List<NotificationCrypto> createNotification) {
    return notificationPriceRepo.createNotificationFromList(createNotification);
  }

  Future<Either<Failure, bool>> allDailyNotificationIsCreated(String cryptoId) {
    return notificationPriceRepo.allDailyNotificationIsCreated(cryptoId);
  }
}
