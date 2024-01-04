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