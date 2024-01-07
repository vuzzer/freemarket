import 'package:defi/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  const WalletModel(
      {required String address,
      required String privateKey,})
      : super(
            address: address,
            privateKey: privateKey,);

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
        address: json["address"],
        privateKey: json["privateKey"],
  );
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "privateKey": privateKey,
    };
  }
}
