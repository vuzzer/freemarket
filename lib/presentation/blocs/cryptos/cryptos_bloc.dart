import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/usecases/crypto-info/crypto_info_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'cryptos_event.dart';
part 'cryptos_state.dart';

part 'cryptos_bloc.freezed.dart';

class CryptosBloc extends Bloc<CryptosEvent, CryptoState> {
  final CryptoInfoUseCase cryptoInfoUseCase;
  CryptosBloc({required this.cryptoInfoUseCase})
      : super(CryptoState.initial()) {
    on<CryptosEvent>((event, emit) async {
      if (event is GetCryptoInfo) {
        emit(state.copyWith(loading: true));

        // Get list crypto
        final cryptos = await cryptoInfoUseCase.getCryptoInfo();

        // call
        cryptos.fold(
            (e) => emit(state.copyWith(
                loading: false,
                successOrFailure:
                    left(CryptoError("Une erreur s'est produites")))),
            (cryptos) {
          final newCrypto = List<CryptoInfo>.from(cryptos);
          emit(state.copyWith(
              cryptos: newCrypto,
              loading: false,
              successOrFailure: right(Success())));
        });
      }
    });
  }
}

@freezed
class CryptoState with _$CryptoState {
  const factory CryptoState(
      {required bool loading,
      required List<CryptoInfo> cryptos,
      required Either<CryptoError, Success> successOrFailure}) = _CryptoState;
  factory CryptoState.initial() => CryptoState(
      cryptos: [], successOrFailure: right(Success()), loading: false);
}

