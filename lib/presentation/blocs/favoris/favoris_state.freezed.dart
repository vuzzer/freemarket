// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favoris_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavorisState {
  Map<String, CryptoInfo> get favoris => throw _privateConstructorUsedError;
  Either<String, bool> get successOrfail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavorisStateCopyWith<FavorisState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavorisStateCopyWith<$Res> {
  factory $FavorisStateCopyWith(
          FavorisState value, $Res Function(FavorisState) then) =
      _$FavorisStateCopyWithImpl<$Res, FavorisState>;
  @useResult
  $Res call(
      {Map<String, CryptoInfo> favoris, Either<String, bool> successOrfail});
}

/// @nodoc
class _$FavorisStateCopyWithImpl<$Res, $Val extends FavorisState>
    implements $FavorisStateCopyWith<$Res> {
  _$FavorisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoris = null,
    Object? successOrfail = null,
  }) {
    return _then(_value.copyWith(
      favoris: null == favoris
          ? _value.favoris
          : favoris // ignore: cast_nullable_to_non_nullable
              as Map<String, CryptoInfo>,
      successOrfail: null == successOrfail
          ? _value.successOrfail
          : successOrfail // ignore: cast_nullable_to_non_nullable
              as Either<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavorisStateImplCopyWith<$Res>
    implements $FavorisStateCopyWith<$Res> {
  factory _$$FavorisStateImplCopyWith(
          _$FavorisStateImpl value, $Res Function(_$FavorisStateImpl) then) =
      __$$FavorisStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, CryptoInfo> favoris, Either<String, bool> successOrfail});
}

/// @nodoc
class __$$FavorisStateImplCopyWithImpl<$Res>
    extends _$FavorisStateCopyWithImpl<$Res, _$FavorisStateImpl>
    implements _$$FavorisStateImplCopyWith<$Res> {
  __$$FavorisStateImplCopyWithImpl(
      _$FavorisStateImpl _value, $Res Function(_$FavorisStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoris = null,
    Object? successOrfail = null,
  }) {
    return _then(_$FavorisStateImpl(
      favoris: null == favoris
          ? _value._favoris
          : favoris // ignore: cast_nullable_to_non_nullable
              as Map<String, CryptoInfo>,
      successOrfail: null == successOrfail
          ? _value.successOrfail
          : successOrfail // ignore: cast_nullable_to_non_nullable
              as Either<String, bool>,
    ));
  }
}

/// @nodoc

class _$FavorisStateImpl with DiagnosticableTreeMixin implements _FavorisState {
  const _$FavorisStateImpl(
      {required final Map<String, CryptoInfo> favoris,
      required this.successOrfail})
      : _favoris = favoris;

  final Map<String, CryptoInfo> _favoris;
  @override
  Map<String, CryptoInfo> get favoris {
    if (_favoris is EqualUnmodifiableMapView) return _favoris;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_favoris);
  }

  @override
  final Either<String, bool> successOrfail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FavorisState(favoris: $favoris, successOrfail: $successOrfail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavorisState'))
      ..add(DiagnosticsProperty('favoris', favoris))
      ..add(DiagnosticsProperty('successOrfail', successOrfail));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavorisStateImpl &&
            const DeepCollectionEquality().equals(other._favoris, _favoris) &&
            (identical(other.successOrfail, successOrfail) ||
                other.successOrfail == successOrfail));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favoris), successOrfail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavorisStateImplCopyWith<_$FavorisStateImpl> get copyWith =>
      __$$FavorisStateImplCopyWithImpl<_$FavorisStateImpl>(this, _$identity);
}

abstract class _FavorisState implements FavorisState {
  const factory _FavorisState(
      {required final Map<String, CryptoInfo> favoris,
      required final Either<String, bool> successOrfail}) = _$FavorisStateImpl;

  @override
  Map<String, CryptoInfo> get favoris;
  @override
  Either<String, bool> get successOrfail;
  @override
  @JsonKey(ignore: true)
  _$$FavorisStateImplCopyWith<_$FavorisStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
