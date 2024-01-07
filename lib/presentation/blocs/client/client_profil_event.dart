part of 'client_profil_bloc.dart';

class ClientProfilEvent extends Equatable {
  const ClientProfilEvent();

  @override
  List<Object> get props => [];
}


class Login extends ClientProfilEvent {}

class Logout extends ClientProfilEvent {}

class Register extends ClientProfilEvent {}
