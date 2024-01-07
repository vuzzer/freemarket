part of 'client_profil_bloc.dart';

class ClientProfilState extends Equatable {
  const ClientProfilState();

  @override
  List<Object> get props => [];
}

class Initial extends ClientProfilState {}

class Loading extends ClientProfilState {}

class Loaded extends ClientProfilState {
  final ClientProfil clientProfil;

  const Loaded(this.clientProfil);
}

class Error extends ClientProfilState {
  final String message;

  const Error(this.message);
}
