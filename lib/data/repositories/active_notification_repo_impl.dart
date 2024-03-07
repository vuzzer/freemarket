import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/active_notification_data.dart';
import 'package:defi/domain/repositories/active-notification/active_notification_repo.dart';

class ActiveNotificationRepoImpl implements ActiveNotificationRepo {
  ActiveNotificationData activeNotificationData;
  ActiveNotificationRepoImpl(this.activeNotificationData);
  @override
  Future<Either<Failure, int>> getActiveNotification() async {
    try {
      final numberActiveNotification =
          await activeNotificationData.getActiveNotification();
      return right(numberActiveNotification);
    } catch (e) {
      return left(InterneFailure());
    }
  }

  @override
  Future<Either<Failure, int>> updateActiveNotification() async {
    try {
      final numberActiveNotification =
          await activeNotificationData.updateActiveNotification();
      return right(numberActiveNotification);
    } catch (e) {
      return left(InterneFailure());
    }
  }
}
