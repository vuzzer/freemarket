import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:defi/domain/repositories/notification-price/notification_price_repo.dart';

class NotificationPriceUsecase {
  final NotificationPriceRepo notificationPriceRepo;
  NotificationPriceUsecase(this.notificationPriceRepo);

  Future<Either<Failure, NotificationPrice>> createNotificationPrice() {
    return notificationPriceRepo.createNotificationPrice();
  }

  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification) {
    return notificationPriceRepo.deleteNotificationPrice(idNotification);
  }

  Future<Either<Failure, NotificationPrice>> getNotificationPrice(
      int idNotification) {
    return notificationPriceRepo.getNotificationPrice(idNotification);
  }
}
