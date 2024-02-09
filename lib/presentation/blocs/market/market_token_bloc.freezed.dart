// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_token_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarketTokenEvent {
  Params get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Params params) getTokenPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Params params)? getTokenPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Params params)? getTokenPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTokenPrice value) getTokenPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTokenPrice value)? getTokenPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTokenPrice value)? getTokenPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarketTokenEventCopyWith<MarketTokenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketTokenEventCopyWith<$Res> {
  factory $MarketTokenEventCopyWith(
          MarketTokenEvent value, $Res Function(MarketTokenEvent) then) =
      _$MarketTokenEventCopyWithImpl<$Res, MarketTokenEvent>;
  @useResult
  $Res call({Params params});
}

/// @nodoc
class _$MarketTokenEventCopyWithImpl<$Res, $Val extends MarketTokenEvent>
    implements $MarketTokenEventCopyWith<$Res> {
  _$MarketTokenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Params,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTokenPriceImplCopyWith<$Res>
    implements $MarketTokenEventCopyWith<$Res> {
  factory _$$GetTokenPriceImplCopyWith(
          _$GetTokenPriceImpl value, $Res Function(_$GetTokenPriceImpl) then) =
      __$$GetTokenPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Params params});
}

/// @nodoc
class __$$GetTokenPriceImplCopyWithImpl<$Res>
    extends _$MarketTokenEventCopyWithImpl<$Res, _$GetTokenPriceImpl>
    implements _$$GetTokenPriceImplCopyWith<$Res> {
  __$$GetTokenPriceImplCopyWithImpl(
      _$GetTokenPriceImpl _value, $Res Function(_$GetTokenPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$GetTokenPriceImpl(
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Params,
    ));
  }
}

/// @nodoc

class _$GetTokenPriceImpl implements GetTokenPrice {
  const _$GetTokenPriceImpl(this.params);

  @override
  final Params params;

  @override
  String toString() {
    return 'MarketTokenEvent.getTokenPrice(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTokenPriceImpl &&
            (identical(other.params, params) || other.params == params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTokenPriceImplCopyWith<_$GetTokenPriceImpl> get copyWith =>
      __$$GetTokenPriceImplCopyWithImpl<_$GetTokenPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Params params) getTokenPrice,
  }) {
    return getTokenPrice(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Params params)? getTokenPrice,
  }) {
    return getTokenPrice?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Params params)? getTokenPrice,
    required TResult orElse(),
  }) {
    if (getTokenPrice != null) {
      return getTokenPrice(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTokenPrice value) getTokenPrice,
  }) {
    return getTokenPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTokenPrice value)? getTokenPrice,
  }) {
    return getTokenPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTokenPrice value)? getTokenPrice,
    required TResult orElse(),
  }) {
    if (getTokenPrice != null) {
      return getTokenPrice(this);
    }
    return orElse();
  }
}

abstract class GetTokenPrice implements MarketTokenEvent {
  const factory GetTokenPrice(final Params params) = _$GetTokenPriceImpl;

  @override
  Params get params;
  @override
  @JsonKey(ignore: true)
  _$$GetTokenPriceImplCopyWith<_$GetTokenPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarketTokenState {
  TokenMarketData? get tokenMarketData => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  Either<CryptoError, Success> get successOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarketTokenStateCopyWith<MarketTokenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketTokenStateCopyWith<$Res> {
  factory $MarketTokenStateCopyWith(
          MarketTokenState value, $Res Function(MarketTokenState) then) =
      _$MarketTokenStateCopyWithImpl<$Res, MarketTokenState>;
  @useResult
  $Res call(
      {TokenMarketData? tokenMarketData,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class _$MarketTokenStateCopyWithImpl<$Res, $Val extends MarketTokenState>
    implements $MarketTokenStateCopyWith<$Res> {
  _$MarketTokenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenMarketData = freezed,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_value.copyWith(
      tokenMarketData: freezed == tokenMarketData
          ? _value.tokenMarketData
          : tokenMarketData // ignore: cast_nullable_to_non_nullable
              as TokenMarketData?,
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
abstract class _$$MarketTokenStateImplCopyWith<$Res>
    implements $MarketTokenStateCopyWith<$Res> {
  factory _$$MarketTokenStateImplCopyWith(_$MarketTokenStateImpl value,
          $Res Function(_$MarketTokenStateImpl) then) =
      __$$MarketTokenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TokenMarketData? tokenMarketData,
      bool loading,
      Either<CryptoError, Success> successOrFailure});
}

/// @nodoc
class __$$MarketTokenStateImplCopyWithImpl<$Res>
    extends _$MarketTokenStateCopyWithImpl<$Res, _$MarketTokenStateImpl>
    implements _$$MarketTokenStateImplCopyWith<$Res> {
  __$$MarketTokenStateImplCopyWithImpl(_$MarketTokenStateImpl _value,
      $Res Function(_$MarketTokenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenMarketData = freezed,
    Object? loading = null,
    Object? successOrFailure = null,
  }) {
    return _then(_$MarketTokenStateImpl(
      tokenMarketData: freezed == tokenMarketData
          ? _value.tokenMarketData
          : tokenMarketData // ignore: cast_nullable_to_non_nullable
              as TokenMarketData?,
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

class _$MarketTokenStateImpl implements _MarketTokenState {
  const _$MarketTokenStateImpl(
      {required this.tokenMarketData,
      required this.loading,
      required this.successOrFailure});

  @override
  final TokenMarketData? tokenMarketData;
  @override
  final bool loading;
  @override
  final Either<CryptoError, Success> successOrFailure;

  @override
  String toString() {
    return 'MarketTokenState(tokenMarketData: $tokenMarketData, loading: $loading, successOrFailure: $successOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketTokenStateImpl &&
            (identical(other.tokenMarketData, tokenMarketData) ||
                other.tokenMarketData == tokenMarketData) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.successOrFailure, successOrFailure) ||
                other.successOrFailure == successOrFailure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tokenMarketData, loading, successOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketTokenStateImplCopyWith<_$MarketTokenStateImpl> get copyWith =>
      __$$MarketTokenStateImplCopyWithImpl<_$MarketTokenStateImpl>(
          this, _$identity);
}

abstract class _MarketTokenState implements MarketTokenState {
  const factory _MarketTokenState(
          {required final TokenMarketData? tokenMarketData,
          required final bool loading,
          required final Either<CryptoError, Success> successOrFailure}) =
      _$MarketTokenStateImpl;

  @override
  TokenMarketData? get tokenMarketData;
  @override
  bool get loading;
  @override
  Either<CryptoError, Success> get successOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$MarketTokenStateImplCopyWith<_$MarketTokenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
