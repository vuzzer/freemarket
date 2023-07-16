// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transfer.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WalletTransfer extends WalletTransfer {
  @override
  final BuiltList<String>? errors;
  @override
  final String? idTransfer;
  @override
  final String? idSender;
  @override
  final String? idRecipient;
  @override
  final WalletTransferStatus status;
  @override
  final bool loading;

  factory _$WalletTransfer([void Function(WalletTransferBuilder)? updates]) =>
      (new WalletTransferBuilder()..update(updates))._build();

  _$WalletTransfer._(
      {this.errors,
      this.idTransfer,
      this.idSender,
      this.idRecipient,
      required this.status,
      required this.loading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'WalletTransfer', 'status');
    BuiltValueNullFieldError.checkNotNull(
        loading, r'WalletTransfer', 'loading');
  }

  @override
  WalletTransfer rebuild(void Function(WalletTransferBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletTransferBuilder toBuilder() =>
      new WalletTransferBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletTransfer &&
        errors == other.errors &&
        idTransfer == other.idTransfer &&
        idSender == other.idSender &&
        idRecipient == other.idRecipient &&
        status == other.status &&
        loading == other.loading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, idTransfer.hashCode);
    _$hash = $jc(_$hash, idSender.hashCode);
    _$hash = $jc(_$hash, idRecipient.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, loading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletTransfer')
          ..add('errors', errors)
          ..add('idTransfer', idTransfer)
          ..add('idSender', idSender)
          ..add('idRecipient', idRecipient)
          ..add('status', status)
          ..add('loading', loading))
        .toString();
  }
}

class WalletTransferBuilder
    implements Builder<WalletTransfer, WalletTransferBuilder> {
  _$WalletTransfer? _$v;

  ListBuilder<String>? _errors;
  ListBuilder<String> get errors =>
      _$this._errors ??= new ListBuilder<String>();
  set errors(ListBuilder<String>? errors) => _$this._errors = errors;

  String? _idTransfer;
  String? get idTransfer => _$this._idTransfer;
  set idTransfer(String? idTransfer) => _$this._idTransfer = idTransfer;

  String? _idSender;
  String? get idSender => _$this._idSender;
  set idSender(String? idSender) => _$this._idSender = idSender;

  String? _idRecipient;
  String? get idRecipient => _$this._idRecipient;
  set idRecipient(String? idRecipient) => _$this._idRecipient = idRecipient;

  WalletTransferStatus? _status;
  WalletTransferStatus? get status => _$this._status;
  set status(WalletTransferStatus? status) => _$this._status = status;

  bool? _loading;
  bool? get loading => _$this._loading;
  set loading(bool? loading) => _$this._loading = loading;

  WalletTransferBuilder();

  WalletTransferBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors?.toBuilder();
      _idTransfer = $v.idTransfer;
      _idSender = $v.idSender;
      _idRecipient = $v.idRecipient;
      _status = $v.status;
      _loading = $v.loading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletTransfer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletTransfer;
  }

  @override
  void update(void Function(WalletTransferBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletTransfer build() => _build();

  _$WalletTransfer _build() {
    _$WalletTransfer _$result;
    try {
      _$result = _$v ??
          new _$WalletTransfer._(
              errors: _errors?.build(),
              idTransfer: idTransfer,
              idSender: idSender,
              idRecipient: idRecipient,
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'WalletTransfer', 'status'),
              loading: BuiltValueNullFieldError.checkNotNull(
                  loading, r'WalletTransfer', 'loading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WalletTransfer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
