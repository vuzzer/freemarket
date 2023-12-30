import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'transaction.g.dart';

enum WalletTransferStatus { started, confirmed, none }

abstract class Transaction
    implements Built<Transaction, TransactionBuilder> {
  factory Transaction([void Function(TransactionBuilder)? updates]) =>
      _$Transaction((b) => b
        ..errors = BuiltList<String>().toBuilder()
        ..status = WalletTransferStatus.none
        ..loading = false
        ..idTransfer
        ..idSender
        ..idRecipient
        ..update(updates));

  Transaction._();

  BuiltList<String>? get errors;

  String? get idTransfer;

  String? get idSender;

  String? get idRecipient;

  WalletTransferStatus get status;

  bool get loading;
}