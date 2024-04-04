// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cryptos_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CryptosEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCryptoInfo,
    required TResult Function() updateCryptoInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCryptoInfo,
    TResult? Function()? updateCryptoInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCryptoInfo,
    TResult Function()? updateCryptoInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCryptoInfo value) getCryptoInfo,
    required TResult Function(UpdateCryptoInfo value) updateCryptoInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCryptoInfo value)? getCryptoInfo,
    TResult? Function(UpdateCryptoInfo value)? updateCryptoInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCryptoInfo value)? getCryptoInfo,
    TResult Function(UpdateCryptoInfo value)? updateCryptoInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptosEventCopyWith<$Res> {
  factory $CryptosEventCopyWith(
          CryptosEvent value, $Res Function(CryptosEvent) then) =
      _$CryptosEventCopyWithImpl<$Res, CryptosEvent>;
}

/// @nodoc
class _$CryptosEventCopyWithImpl<$Res, $Val extends CryptosEvent>
    implements $CryptosEventCopyWith<$Res> {
  _$CryptosEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCryptoInfoImplCopyWith<$Res> {
  factory _$$GetCryptoInfoImplCopyWith(
          _$GetCryptoInfoImpl value, $Res Function(_$GetCryptoInfoImpl) then) =
      __$$GetCryptoInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCryptoInfoImplCopyWithImpl<$Res>
    extends _$CryptosEventCopyWithImpl<$Res, _$GetCryptoInfoImpl>
    implements _$$GetCryptoInfoImplCopyWith<$Res> {
  __$$GetCryptoInfoImplCopyWithImpl(
      _$GetCryptoInfoImpl _value, $Res Function(_$GetCryptoInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCryptoInfoImpl
    with DiagnosticableTreeMixin
    implements GetCryptoInfo {
  const _$GetCryptoInfoImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CryptosEvent.getCryptoInfo()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CryptosEvent.getCryptoInfo'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCryptoInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCryptoInfo,
    required TResult Function() updateCryptoInfo,
  }) {
    return getCryptoInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCryptoInfo,
    TResult? Function()? updateCryptoInfo,
  }) {
    return getCryptoInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCryptoInfo,
    TResult Function()? updateCryptoInfo,
    required TResult orElse(),
  }) {
    if (getCryptoInfo != null) {
      return getCryptoInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCryptoInfo value) getCryptoInfo,
    required TResult Function(UpdateCryptoInfo value) updateCryptoInfo,
  }) {
    return getCryptoInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCryptoInfo value)? getCryptoInfo,
    TResult? Function(UpdateCryptoInfo value)? updateCryptoInfo,
  }) {
    return getCryptoInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCryptoInfo value)? getCryptoInfo,
    TResult Function(UpdateCryptoInfo value)? updateCryptoInfo,
    required TResult orElse(),
  }) {
    if (getCryptoInfo != null) {
      return getCryptoInfo(this);
    }
    return orElse();
  }
}

abstract class GetCryptoInfo implements CryptosEvent {
  const factory GetCryptoInfo() = _$GetCryptoInfoImpl;
}

/// @nodoc
abstract class _$$UpdateCryptoInfoImplCopyWith<$Res> {
  factory _$$UpdateCryptoInfoImplCopyWith(_$UpdateCryptoInfoImpl value,
          $Res Function(_$UpdateCryptoInfoImpl) then) =
      __$$UpdateCryptoInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateCryptoInfoImplCopyWithImpl<$Res>
    extends _$CryptosEventCopyWithImpl<$Res, _$UpdateCryptoInfoImpl>
    implements _$$UpdateCryptoInfoImplCopyWith<$Res> {
  __$$UpdateCryptoInfoImplCopyWithImpl(_$UpdateCryptoInfoImpl _value,
      $Res Function(_$UpdateCryptoInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateCryptoInfoImpl
    with DiagnosticableTreeMixin
    implements UpdateCryptoInfo {
  const _$UpdateCryptoInfoImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CryptosEvent.updateCryptoInfo()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'CryptosEvent.updateCryptoInfo'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateCryptoInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCryptoInfo,
    required TResult Function() updateCryptoInfo,
  }) {
    return updateCryptoInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCryptoInfo,
    TResult? Function()? updateCryptoInfo,
  }) {
    return updateCryptoInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCryptoInfo,
    TResult Function()? updateCryptoInfo,
    required TResult orElse(),
  }) {
    if (updateCryptoInfo != null) {
      return updateCryptoInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCryptoInfo value) getCryptoInfo,
    required TResult Function(UpdateCryptoInfo value) updateCryptoInfo,
  }) {
    return updateCryptoInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCryptoInfo value)? getCryptoInfo,
    TResult? Function(UpdateCryptoInfo value)? updateCryptoInfo,
  }) {
    return updateCryptoInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCryptoInfo value)? getCryptoInfo,
    TResult Function(UpdateCryptoInfo value)? updateCryptoInfo,
    required TResult orElse(),
  }) {
    if (updateCryptoInfo != null) {
      return updateCryptoInfo(this);
    }
    return orElse();
  }
}

abstract class UpdateCryptoInfo implements CryptosEvent {
  const factory UpdateCryptoInfo() = _$UpdateCryptoInfoImpl;
}

/// @nodoc
mixin _$CryptoState {
  bool get loading => throw _privateConstructorUsedError;
  List<CryptoInfo> get cryptos => throw _privateConstructorUsedError;
  Either<CryptoError, Success> get successOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CryptoStateCopyWith<CryptoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoStateCopyWith<$Res> {
  factory $CryptoStateCopyWith(
          CryptoState value, $Res Function(CryptoState) then) =
      _$CryptoStateCopyWithImpl<$Res, CryptoState>;
  @useResult
  $Res call(
      {bool loading,
      List<CryptoInfo> cryptos,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class _$CryptoStateCopyWithImpl<$Res, $Val extends CryptoState>
    implements $CryptoStateCopyWith<$Res> {
  _$CryptoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cryptos = null,
    Object? successOrFailure = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cryptos: null == cryptos
          ? _value.cryptos
          : cryptos // ignore: cast_nullable_to_non_nullable
              as List<CryptoInfo>,
      successOrFailure: null == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoStateImplCopyWith<$Res>
    implements $CryptoStateCopyWith<$Res> {
  factory _$$CryptoStateImplCopyWith(
          _$CryptoStateImpl value, $Res Function(_$CryptoStateImpl) then) =
      __$$CryptoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<CryptoInfo> cryptos,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class __$$CryptoStateImplCopyWithImpl<$Res>
    extends _$CryptoStateCopyWithImpl<$Res, _$CryptoStateImpl>
    implements _$$CryptoStateImplCopyWith<$Res> {
  __$$CryptoStateImplCopyWithImpl(
      _$CryptoStateImpl _value, $Res Function(_$CryptoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cryptos = null,
    Object? successOrFailure = null,
  }) {
    return _then(_$CryptoStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cryptos: null == cryptos
          ? _value._cryptos
          : cryptos // ignore: cast_nullable_to_non_nullable
              as List<CryptoInfo>,
      successOrFailure: null == successOrFailure
          ? _value.successOrFailure
          : successOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ));
  }
}

/// @nodoc

class _$CryptoStateImpl with DiagnosticableTreeMixin implements _CryptoState {
  const _$CryptoStateImpl(
      {required this.loading,
      required final List<CryptoInfo> cryptos,
      required this.successOrFailure})
      : _cryptos = cryptos;

  @override
  final bool loading;
  final List<CryptoInfo> _cryptos;
  @override
  List<CryptoInfo> get cryptos {
    if (_cryptos is EqualUnmodifiableListView) return _cryptos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cryptos);
  }

  @override
  final Either<CryptoError, Success> successOrFailure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CryptoState(loading: $loading, cryptos: $cryptos, successOrFailure: $successOrFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CryptoState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('cryptos', cryptos))
      ..add(DiagnosticsProperty('successOrFailure', successOrFailure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._cryptos, _cryptos) &&
            (identical(other.successOrFailure, successOrFailure) ||
                other.successOrFailure == successOrFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_cryptos), successOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoStateImplCopyWith<_$CryptoStateImpl> get copyWith =>
      __$$CryptoStateImplCopyWithImpl<_$CryptoStateImpl>(this, _$identity);
}

abstract class _CryptoState implements CryptoState {
  const factory _CryptoState(
          {required final bool loading,
          required final List<CryptoInfo> cryptos,
          required final Either<CryptoError, Success> successOrFailure}) =
      _$CryptoStateImpl;

  @override
  bool get loading;
  @override
  List<CryptoInfo> get cryptos;
  @override
  Either<CryptoError, Success> get successOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$CryptoStateImplCopyWith<_$CryptoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
