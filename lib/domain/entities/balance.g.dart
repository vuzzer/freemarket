// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Balance extends Balance {
  @override
  final String balance;
  @override
  final NetworkType network;

  factory _$Balance([void Function(BalanceBuilder)? updates]) =>
      (new BalanceBuilder()..update(updates))._build();

  _$Balance._({required this.balance, required this.network}) : super._() {
    BuiltValueNullFieldError.checkNotNull(balance, r'Balance', 'balance');
    BuiltValueNullFieldError.checkNotNull(network, r'Balance', 'network');
  }

  @override
  Balance rebuild(void Function(BalanceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BalanceBuilder toBuilder() => new BalanceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Balance &&
        balance == other.balance &&
        network == other.network;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jc(_$hash, network.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Balance')
          ..add('balance', balance)
          ..add('network', network))
        .toString();
  }
}

class BalanceBuilder implements Builder<Balance, BalanceBuilder> {
  _$Balance? _$v;

  String? _balance;
  String? get balance => _$this._balance;
  set balance(String? balance) => _$this._balance = balance;

  NetworkType? _network;
  NetworkType? get network => _$this._network;
  set network(NetworkType? network) => _$this._network = network;

  BalanceBuilder();

  BalanceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _balance = $v.balance;
      _network = $v.network;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Balance other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Balance;
  }

  @override
  void update(void Function(BalanceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Balance build() => _build();

  _$Balance _build() {
    final _$result = _$v ??
        new _$Balance._(
            balance: BuiltValueNullFieldError.checkNotNull(
                balance, r'Balance', 'balance'),
            network: BuiltValueNullFieldError.checkNotNull(
                network, r'Balance', 'network'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
