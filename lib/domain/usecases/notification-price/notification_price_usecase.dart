import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/domain/repositories/notification-crypto/notification_price_repo.dart';

class NotificationPriceUsecase {
  final NotificationPriceRepo notificationPriceRepo;
  NotificationPriceUsecase(this.notificationPriceRepo);

  Future<Either<Failure, NotificationCrypto>> createNotificationPrice(NotificationCrypto createNotif) {
    return notificationPriceRepo.createNotificationPrice(createNotif);
  }

  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification) {
    return notificationPriceRepo.deleteNotificationPrice(idNotification);
  }

  Future<Either<Failure, List<NotificationCrypto>>> getNotificationPrice(
      String cryptoId) {
    return notificationPriceRepo.getNotificationPrice(cryptoId);
  }
}
