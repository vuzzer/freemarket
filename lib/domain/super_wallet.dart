import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:built_value/built_value.dart';

part 'super_wallet.g.dart';

abstract class SuperWallet implements Built<SuperWallet, SuperWalletBuilder> {
  
  factory SuperWallet([void Function(SuperWalletBuilder)? updates]) =>
      _$SuperWallet((b) => b..wallets={
    NetworkType.Ethereum: Wallet((b) => b..network = NetworkType.Ethereum),
    NetworkType.BSC: Wallet((b) => b..network = NetworkType.BSC),
    NetworkType.Matic: Wallet((b) => b..network = NetworkType.Matic)
  });
  
  SuperWallet._();

  String? get privateKey;
  String? get address;
  Map<NetworkType, Wallet> get wallets;
}
