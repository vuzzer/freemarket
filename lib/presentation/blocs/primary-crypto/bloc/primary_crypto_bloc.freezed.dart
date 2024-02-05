// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'primary_crypto_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrimaryCryptoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPrimaryCrypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPrimaryCrypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPrimaryCrypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPrimaryCrypto value) getPrimaryCrypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPrimaryCrypto value)? getPrimaryCrypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPrimaryCrypto value)? getPrimaryCrypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryCryptoEventCopyWith<$Res> {
  factory $PrimaryCryptoEventCopyWith(
          PrimaryCryptoEvent value, $Res Function(PrimaryCryptoEvent) then) =
      _$PrimaryCryptoEventCopyWithImpl<$Res, PrimaryCryptoEvent>;
}

/// @nodoc
class _$PrimaryCryptoEventCopyWithImpl<$Res, $Val extends PrimaryCryptoEvent>
    implements $PrimaryCryptoEventCopyWith<$Res> {
  _$PrimaryCryptoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPrimaryCryptoImplCopyWith<$Res> {
  factory _$$GetPrimaryCryptoImplCopyWith(_$GetPrimaryCryptoImpl value,
          $Res Function(_$GetPrimaryCryptoImpl) then) =
      __$$GetPrimaryCryptoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPrimaryCryptoImplCopyWithImpl<$Res>
    extends _$PrimaryCryptoEventCopyWithImpl<$Res, _$GetPrimaryCryptoImpl>
    implements _$$GetPrimaryCryptoImplCopyWith<$Res> {
  __$$GetPrimaryCryptoImplCopyWithImpl(_$GetPrimaryCryptoImpl _value,
      $Res Function(_$GetPrimaryCryptoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPrimaryCryptoImpl implements GetPrimaryCrypto {
  const _$GetPrimaryCryptoImpl();

  @override
  String toString() {
    return 'PrimaryCryptoEvent.getPrimaryCrypto()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPrimaryCryptoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPrimaryCrypto,
  }) {
    return getPrimaryCrypto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPrimaryCrypto,
  }) {
    return getPrimaryCrypto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPrimaryCrypto,
    required TResult orElse(),
  }) {
    if (getPrimaryCrypto != null) {
      return getPrimaryCrypto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPrimaryCrypto value) getPrimaryCrypto,
  }) {
    return getPrimaryCrypto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPrimaryCrypto value)? getPrimaryCrypto,
  }) {
    return getPrimaryCrypto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPrimaryCrypto value)? getPrimaryCrypto,
    required TResult orElse(),
  }) {
    if (getPrimaryCrypto != null) {
      return getPrimaryCrypto(this);
    }
    return orElse();
  }
}

abstract class GetPrimaryCrypto implements PrimaryCryptoEvent {
  const factory GetPrimaryCrypto() = _$GetPrimaryCryptoImpl;
}

/// @nodoc
mixin _$PrimaryCryptoState {
  CryptoInfo? get crypto => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Either<CryptoError, Success> get successOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrimaryCryptoStateCopyWith<PrimaryCryptoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryCryptoStateCopyWith<$Res> {
  factory $PrimaryCryptoStateCopyWith(
          PrimaryCryptoState value, $Res Function(PrimaryCryptoState) then) =
      _$PrimaryCryptoStateCopyWithImpl<$Res, PrimaryCryptoState>;
  @useResult
  $Res call(
      {CryptoInfo? crypto,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class _$PrimaryCryptoStateCopyWithImpl<$Res, $Val extends PrimaryCryptoState>
    implements $PrimaryCryptoStateCopyWith<$Res> {
  _$PrimaryCryptoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crypto = freezed,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_value.copyWith(
      crypto: freezed == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as CryptoInfo?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      successOrFailure: null == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrimaryCrptoStateImplCopyWith<$Res>
    implements $PrimaryCryptoStateCopyWith<$Res> {
  factory _$$PrimaryCrptoStateImplCopyWith(_$PrimaryCrptoStateImpl value,
          $Res Function(_$PrimaryCrptoStateImpl) then) =
      __$$PrimaryCrptoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CryptoInfo? crypto,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class __$$PrimaryCrptoStateImplCopyWithImpl<$Res>
    extends _$PrimaryCryptoStateCopyWithImpl<$Res, _$PrimaryCrptoStateImpl>
    implements _$$PrimaryCrptoStateImplCopyWith<$Res> {
  __$$PrimaryCrptoStateImplCopyWithImpl(_$PrimaryCrptoStateImpl _value,
      $Res Function(_$PrimaryCrptoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crypto = freezed,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_$PrimaryCrptoStateImpl(
      crypto: freezed == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as CryptoInfo?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      successOrFailure: null == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ));
  }
}

/// @nodoc

class _$PrimaryCrptoStateImpl implements _PrimaryCrptoState {
  const _$PrimaryCrptoStateImpl(
      {required this.crypto,
      required this.loading,
      required this.successOrFailure});

  @override
  final CryptoInfo? crypto;
  @override
  final bool loading;
  @override
  final Either<CryptoError, Success> successOrFailure;

  @override
  String toString() {
    return 'PrimaryCryptoState(crypto: $crypto, loading: $loading, successOrFailure: $successOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrimaryCrptoStateImpl &&
            (identical(other.crypto, crypto) || other.crypto == crypto) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.successOrFailure, successOrFailure) ||
                other.successOrFailure == successOrFailure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, crypto, loading, successOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrimaryCrptoStateImplCopyWith<_$PrimaryCrptoStateImpl> get copyWith =>
      __$$PrimaryCrptoStateImplCopyWithImpl<_$PrimaryCrptoStateImpl>(
          this, _$identity);
}

abstract class _PrimaryCrptoState implements PrimaryCryptoState {
  const factory _PrimaryCrptoState(
          {required final CryptoInfo? crypto,
          required final bool loading,
          required final Either<CryptoError, Success> successOrFailure}) =
      _$PrimaryCrptoStateImpl;

  @override
  CryptoInfo? get crypto;
  @override
  bool get loading;
  @override
  Either<CryptoError, Success> get successOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$PrimaryCrptoStateImplCopyWith<_$PrimaryCrptoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
