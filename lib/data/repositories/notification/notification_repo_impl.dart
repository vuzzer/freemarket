import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:defi/domain/repositories/notification-price/notification_price_repo.dart';

class NotificationPriceRepoImpl implements NotificationPriceRepo {
  final NotificationPriceData notificationPriceData;

  NotificationPriceRepoImpl({required this.notificationPriceData});

  @override
  Future<Either<Failure, NotificationPrice>> createNotificationPrice(
      {required String cryptoId,
      required double price,
      required int idNotificaton}) async {
    try {
      final created = await notificationPriceData.createNotificationPrice(
          cryptoId: cryptoId, price: price, id: idNotificaton);
      return right(created);
    } on NotificationExistException {
      return left(NotificationExistFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteNotificationPrice(int idNotification) {
    // TODO: implement deleteNotificationPrice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NotificationPrice>>> getNotificationPrice() {
    // TODO: implement getNotificationPrice
    throw UnimplementedError();
  }
}
