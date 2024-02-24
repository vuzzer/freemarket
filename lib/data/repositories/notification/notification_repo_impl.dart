import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/domain/repositories/notification-crypto/notification_price_repo.dart';

class NotificationPriceRepoImpl implements NotificationPriceRepo {
  final NotificationPriceData notificationPriceData;

  NotificationPriceRepoImpl({required this.notificationPriceData});

  @override
  Future<Either<Failure, NotificationCrypto>> createNotificationPrice(
      NotificationCrypto createNotif) async {
    try {
      final created =
          await notificationPriceData.createNotificationPrice(createNotif);
      return right(created);
    } on NotificationExistException {
      return left(NotificationExistFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteNotificationPrice(
      int idNotification) async {
    try {
      final removed =
          await notificationPriceData.deleteNotificationPrice(idNotification);
      return right(removed);
    } on DeleteNotificationPriceException {
      return left(DeleteNotificationPriceFailure());
    }
  }

  @override
  Future<Either<Failure, List<NotificationCrypto>>> getNotificationPrice(
      String cryptoId) async {
    try {
      final notifications =
          await notificationPriceData.getNotificationPrice(cryptoId);
      return right(notifications);
    } on GetNotificationException {
      return left(GetNotificationPriceFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateNotification(
      NotificationCrypto updateNotification) async {
    try {
      final updated =
          await notificationPriceData.updateNotification(updateNotification);
      return right(updated);
    } on NotificationExistException {
      return left(NotificationUpdateFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createNotificationFromList(
      List<NotificationCrypto> createNotification) async {
    try {
      final created = await notificationPriceData
          .createNotificationFromList(createNotification);
      return right(created);
    } on NotificationCreateException {
      return left(NotificationCreateFailure());
    }
  }
  
  @override
  Future<Either<Failure, bool>> allDailyNotificationIsCreated(String cryptoId) async {
    try {
      final notifications =
          await notificationPriceData.allDailyNotificationIsCreated(cryptoId);
      return right(notifications);
    } on GetNotificationException {
      return left(GetNotificationPriceFailure());
    }
  }
}
