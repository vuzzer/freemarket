import 'package:bloc/bloc.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/usecases/crypto-info/crypto_info_usecases.dart';
import 'package:equatable/equatable.dart';

part 'cryptos_event.dart';
part 'cryptos_state.dart';

class CryptosBloc extends Bloc<CryptosEvent, CryptosState> {
  final CryptoInfoUseCase cryptoInfoUseCase;
  CryptosBloc({required this.cryptoInfoUseCase}) : super(CryptosInitial()) {
    on<CryptosEvent>((event, emit) async {
      if (event is GetCryptoInfo) {
        emit(CryptosLoading());

        // Get list crypto
        final cryptos = await cryptoInfoUseCase.getCryptoInfo();

        // call
        cryptos.fold(
            (e) => emit(const CryptosError("Une erreur s'est produites")),
            (data) => emit(CryptosLoaded(data)));
      }
    });
  }
}
