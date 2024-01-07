import 'package:defi/domain/entities/client_profil.dart';

class ClientProfilModel extends ClientProfil {
  const ClientProfilModel(
      {required super.email,
      required super.uid,
      required super.username,
      required super.mnemonic,
      required super.privateKey,
      required super.address});

  factory ClientProfilModel.fromJson(Map<String, dynamic> json) {
    return ClientProfilModel(
        email: json["email"],
        uid: json["uid"],
        username: json["username"],
        mnemonic: json["mnemonic"],
        privateKey: json["privateKey"],
        address: json["address"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "uid": uid,
      "mnemonic": mnemonic,
      "username": username,
      "privateKey": privateKey,
      "address": address
    };
  }
}
