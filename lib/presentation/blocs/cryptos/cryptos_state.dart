part of 'cryptos_bloc.dart';

class CryptosState extends Equatable {
  const CryptosState();

  @override
  List<Object> get props => [];
}

class CryptosInitial extends CryptosState {}

class CryptosLoading extends CryptosState {}

class CryptosLoaded extends CryptosState {
  final List<CryptoInfo> cryptos;
  const CryptosLoaded(this.cryptos);
}

class CryptosError extends CryptosState {
  final String message;
  const CryptosError(this.message);
}
