import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';

abstract class SettingsRepo {
  // Change visible crypto
  Future<Either<Failure, void>> changeVisible();
  // Add favoris crypto
  Future<Either<Failure, void>> addToFavoris(String crypto);
  // Remove to favoris crypto
  Future<Either<Failure, void>> removeToFavoris(String crypto);
  // Schedule crypto notification
  Future<Either<Failure, void>> activeNotification(String crypto);
  // Unsubscribe notification crypto
  Future<Either<Failure, void>> cancelNotification(String crypto);
}
