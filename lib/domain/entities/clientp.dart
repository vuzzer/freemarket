import 'package:equatable/equatable.dart';

class ClientP extends Equatable {
  final String email;
  final String mnemonic;
  final String uid; //Owner of wallet
  final String username;
  final String privateKey;
  final String address;

  const ClientP(
      {required this.email,
      required this.uid,
      required this.username,
      required this.mnemonic,
      required this.privateKey,
      required this.address});

  @override
  List<Object> get props => [email, uid, username];
}
