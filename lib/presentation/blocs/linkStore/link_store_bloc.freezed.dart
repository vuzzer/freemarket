// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_store_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LinkStoreEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLinkStoreToShare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLinkStoreToShare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLinkStoreToShare,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLinkStoreToShare value) getLinkStoreToShare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLinkStoreToShare value)? getLinkStoreToShare,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLinkStoreToShare value)? getLinkStoreToShare,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkStoreEventCopyWith<$Res> {
  factory $LinkStoreEventCopyWith(
          LinkStoreEvent value, $Res Function(LinkStoreEvent) then) =
      _$LinkStoreEventCopyWithImpl<$Res, LinkStoreEvent>;
}

/// @nodoc
class _$LinkStoreEventCopyWithImpl<$Res, $Val extends LinkStoreEvent>
    implements $LinkStoreEventCopyWith<$Res> {
  _$LinkStoreEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetLinkStoreToShareImplCopyWith<$Res> {
  factory _$$GetLinkStoreToShareImplCopyWith(_$GetLinkStoreToShareImpl value,
          $Res Function(_$GetLinkStoreToShareImpl) then) =
      __$$GetLinkStoreToShareImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLinkStoreToShareImplCopyWithImpl<$Res>
    extends _$LinkStoreEventCopyWithImpl<$Res, _$GetLinkStoreToShareImpl>
    implements _$$GetLinkStoreToShareImplCopyWith<$Res> {
  __$$GetLinkStoreToShareImplCopyWithImpl(_$GetLinkStoreToShareImpl _value,
      $Res Function(_$GetLinkStoreToShareImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLinkStoreToShareImpl implements GetLinkStoreToShare {
  const _$GetLinkStoreToShareImpl();

  @override
  String toString() {
    return 'LinkStoreEvent.getLinkStoreToShare()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLinkStoreToShareImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLinkStoreToShare,
  }) {
    return getLinkStoreToShare();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLinkStoreToShare,
  }) {
    return getLinkStoreToShare?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLinkStoreToShare,
    required TResult orElse(),
  }) {
    if (getLinkStoreToShare != null) {
      return getLinkStoreToShare();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLinkStoreToShare value) getLinkStoreToShare,
  }) {
    return getLinkStoreToShare(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLinkStoreToShare value)? getLinkStoreToShare,
  }) {
    return getLinkStoreToShare?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLinkStoreToShare value)? getLinkStoreToShare,
    required TResult orElse(),
  }) {
    if (getLinkStoreToShare != null) {
      return getLinkStoreToShare(this);
    }
    return orElse();
  }
}

abstract class GetLinkStoreToShare implements LinkStoreEvent {
  const factory GetLinkStoreToShare() = _$GetLinkStoreToShareImpl;
}

/// @nodoc
mixin _$LinkStoreState {
  String get link => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Either<CryptoError, Success> get successOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LinkStoreStateCopyWith<LinkStoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkStoreStateCopyWith<$Res> {
  factory $LinkStoreStateCopyWith(
          LinkStoreState value, $Res Function(LinkStoreState) then) =
      _$LinkStoreStateCopyWithImpl<$Res, LinkStoreState>;
  @useResult
  $Res call(
      {String link,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class _$LinkStoreStateCopyWithImpl<$Res, $Val extends LinkStoreState>
    implements $LinkStoreStateCopyWith<$Res> {
  _$LinkStoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$LinkStoreStateImplCopyWith<$Res>
    implements $LinkStoreStateCopyWith<$Res> {
  factory _$$LinkStoreStateImplCopyWith(_$LinkStoreStateImpl value,
          $Res Function(_$LinkStoreStateImpl) then) =
      __$$LinkStoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String link,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class __$$LinkStoreStateImplCopyWithImpl<$Res>
    extends _$LinkStoreStateCopyWithImpl<$Res, _$LinkStoreStateImpl>
    implements _$$LinkStoreStateImplCopyWith<$Res> {
  __$$LinkStoreStateImplCopyWithImpl(
      _$LinkStoreStateImpl _value, $Res Function(_$LinkStoreStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_$LinkStoreStateImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$LinkStoreStateImpl implements _LinkStoreState {
  const _$LinkStoreStateImpl(
      {required this.link,
      required this.loading,
      required this.successOrFailure});

  @override
  final String link;
  @override
  final bool loading;
  @override
  final Either<CryptoError, Success> successOrFailure;

  @override
  String toString() {
    return 'LinkStoreState(link: $link, loading: $loading, successOrFailure: $successOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkStoreStateImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.successOrFailure, successOrFailure) ||
                other.successOrFailure == successOrFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link, loading, successOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkStoreStateImplCopyWith<_$LinkStoreStateImpl> get copyWith =>
      __$$LinkStoreStateImplCopyWithImpl<_$LinkStoreStateImpl>(
          this, _$identity);
}

abstract class _LinkStoreState implements LinkStoreState {
  const factory _LinkStoreState(
          {required final String link,
          required final bool loading,
          required final Either<CryptoError, Success> successOrFailure}) =
      _$LinkStoreStateImpl;

  @override
  String get link;
  @override
  bool get loading;
  @override
  Either<CryptoError, Success> get successOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$LinkStoreStateImplCopyWith<_$LinkStoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
