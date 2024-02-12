import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:defi/domain/repositories/notification-price/notification_price_repo.dart';

class NotificationPriceUsecase {
  final NotificationPriceRepo notificationPriceRepo;
  NotificationPriceUsecase(this.notificationPriceRepo);

  Future<Either<Failure, NotificationPrice>> createNotificationPrice({required String cryptoId,required double price, required int idNotificaton }) {
    return notificationPriceRepo.createNotificationPrice(cryptoId: cryptoId, price: price, idNotificaton: idNotificaton );
  }

  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification) {
    return notificationPriceRepo.deleteNotificationPrice(idNotification);
  }

  Future<Either<Failure, List<NotificationPrice>>> getNotificationPrice(
      int idNotification) {
    return notificationPriceRepo.getNotificationPrice();
  }
}
