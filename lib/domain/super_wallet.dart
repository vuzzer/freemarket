import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:built_value/built_value.dart';

part 'super_wallet.g.dart';

abstract class SuperWallet implements Built<SuperWallet, SuperWalletBuilder> {
  
  factory SuperWallet([void Function(SuperWalletBuilder)? updates]) => _$SuperWallet();
  
  SuperWallet._();

  String? get privateKey;
  String? get address;
  Map<NetworkType, Wallet> get wallets;
}
