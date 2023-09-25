import 'package:built_value/built_value.dart';
import 'package:defi/domain/entities/network_type.dart';

part 'balance.g.dart';

abstract class Balance implements Built<Balance, BalanceBuilder> {
  factory Balance([void Function(BalanceBuilder)? updates]) =>
      _$Balance((b) => b
        ..balance
        ..network);

  Balance._();

  String get balance;
  NetworkType get network;
}
