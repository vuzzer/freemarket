import 'package:bloc/bloc.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/usecases/primary-crypto/primary_crypto_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/base_type.dart';

part 'primary_crypto_event.dart';
part 'primary_crypto_state.dart';
part 'primary_crypto_bloc.freezed.dart';

class PrimaryCryptoBloc extends Bloc<PrimaryCryptoEvent, PrimaryCryptoState> {
  final PrimaryCryptoUsecase primaryCryptoUsecase;
  PrimaryCryptoBloc({required this.primaryCryptoUsecase})
      : super(PrimaryCryptoState.initial()) {
    on<PrimaryCryptoEvent>((event, emit) async {
     await event.map(getPrimaryCrypto: (e) async {
        emit(state.copyWith(loading: true));

        final primarCrypto = await primaryCryptoUsecase.getPrimaryCrypto();

        primarCrypto.fold(
            (e) => emit(state.copyWith(
              loading: false,
                successOrFailure:
                    left(CryptoError("Erreur lors du chargement")), )),
            (crypto) => emit(state.copyWith(
              loading: false,
                crypto: crypto, successOrFailure: right(Success()))));
      });
    });
  }
}
