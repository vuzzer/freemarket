import 'package:bloc/bloc.dart';
import 'package:defi/domain/entities/client_profil.dart';
import 'package:defi/domain/usecases/clientProfil/clientProfil_usecase.dart';
import 'package:equatable/equatable.dart';

part 'client_profil_event.dart';
part 'client_profil_state.dart';

class ClientProfilBloc extends Bloc<ClientProfilEvent, ClientProfilState> {
  final ClientProfilUsecase clientProfilUsecase;

  ClientProfilBloc({required this.clientProfilUsecase}) : super(Initial()) {
    on<ClientProfilEvent>((event, emit) async {
      // Check event triggered
      switch (event.runtimeType) {
        // Login event
        case Login:
          // Emit state Loading when used try to connect
          emit(Loading());

          // For test
          await Future.delayed(const Duration(seconds: 6))
              .whenComplete(() => emit(Initial()));

          // connect an user
          //final dataClient = await clientProfilUsecase.login();

          // If error, we emit Error
          // otherwise, we emit Loaded state with data
          //dataClient.fold((failure) => {emit(const Error("La connnexion a echoué"))},(clientProfil) => {emit(Loaded(clientProfil))});

          break;
        case Register:
          break;
        case Logout:
          break;
      }
    });
  }
}
