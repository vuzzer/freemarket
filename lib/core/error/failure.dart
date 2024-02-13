import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  
}


class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}


class UserConnectionFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class UserNotExistFaillure extends Failure{
  @override
  List<Object?> get props => [];
}

class FailedLoginFailure extends Failure{
  @override
  List<Object?> get props => [];
}

// When loading crypto favoris list
class InterneFailure extends Failure{
  @override
  List<Object?> get props => [];
}

// Favoris crypto
class LoadFavorisFailure extends Failure {
  @override
  List<Object?> get props => [];
}

// Primary crypto failure
class GetPrimaryCryptoFailure extends Failure {
  @override
  List<Object?> get props => [];
}

// Change primary crypto failure
class ChangePrimaryCryptoFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class RemovePrimaryCryptoFailure extends Failure {
  @override
  List<Object?> get props => [];
}


// Notification failures
class NotificationExistFailure extends Failure {
  @override
  List<Object?> get props => [];
}
