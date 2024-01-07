import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String address;
  final String privateKey;

  const Wallet(
      {
      required this.address,
      required this.privateKey});

  @override
  List<Object> get props => [address, privateKey];
}
