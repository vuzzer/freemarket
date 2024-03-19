import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/repositories/active-notification/active_notification_repo.dart';

class ActiveNotificationUsecase {
  final ActiveNotificationRepo activeNotificationRepo;

  ActiveNotificationUsecase(this.activeNotificationRepo);

  Future<Either<Failure, int>> getActiveNotification() {
    return activeNotificationRepo.getActiveNotification();
  }

  Future<Either<Failure, int>> updateActiveNotification(int activeNotification) {
    return activeNotificationRepo.updateActiveNotification(activeNotification);
  }
}
