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

class LoadFavorisFailure extends Failure {
  @override
  List<Object?> get props => [];
}
