// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_wallet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SuperWallet extends SuperWallet {
  @override
  final String? privateKey;
  @override
  final String? address;
  @override
  final Map<NetworkType, Wallet> wallets;

  factory _$SuperWallet([void Function(SuperWalletBuilder)? updates]) =>
      (new SuperWalletBuilder()..update(updates))._build();

  _$SuperWallet._({this.privateKey, this.address, required this.wallets})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(wallets, r'SuperWallet', 'wallets');
  }

  @override
  SuperWallet rebuild(void Function(SuperWalletBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuperWalletBuilder toBuilder() => new SuperWalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuperWallet &&
        privateKey == other.privateKey &&
        address == other.address &&
        wallets == other.wallets;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, privateKey.hashCode), address.hashCode), wallets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SuperWallet')
          ..add('privateKey', privateKey)
          ..add('address', address)
          ..add('wallets', wallets))
        .toString();
  }
}

class SuperWalletBuilder implements Builder<SuperWallet, SuperWalletBuilder> {
  _$SuperWallet? _$v;

  String? _privateKey;
  String? get privateKey => _$this._privateKey;
  set privateKey(String? privateKey) => _$this._privateKey = privateKey;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  Map<NetworkType, Wallet>? _wallets;
  Map<NetworkType, Wallet>? get wallets => _$this._wallets;
  set wallets(Map<NetworkType, Wallet>? wallets) => _$this._wallets = wallets;

  SuperWalletBuilder();

  SuperWalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _privateKey = $v.privateKey;
      _address = $v.address;
      _wallets = $v.wallets;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuperWallet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SuperWallet;
  }

  @override
  void update(void Function(SuperWalletBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuperWallet build() => _build();

  _$SuperWallet _build() {
    final _$result = _$v ??
        new _$SuperWallet._(
            privateKey: privateKey,
            address: address,
            wallets: BuiltValueNullFieldError.checkNotNull(
                wallets, r'SuperWallet', 'wallets'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
