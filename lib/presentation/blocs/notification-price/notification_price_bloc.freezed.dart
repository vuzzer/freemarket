// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationPriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoId, double price, int idNotification)
        createNotificationPrice,
    required TResult Function(int idNotification) deleteNotificationPrice,
    required TResult Function() getNotificationPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult? Function(int idNotification)? deleteNotificationPrice,
    TResult? Function()? getNotificationPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult Function(int idNotification)? deleteNotificationPrice,
    TResult Function()? getNotificationPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPriceEventCopyWith<$Res> {
  factory $NotificationPriceEventCopyWith(NotificationPriceEvent value,
          $Res Function(NotificationPriceEvent) then) =
      _$NotificationPriceEventCopyWithImpl<$Res, NotificationPriceEvent>;
}

/// @nodoc
class _$NotificationPriceEventCopyWithImpl<$Res,
        $Val extends NotificationPriceEvent>
    implements $NotificationPriceEventCopyWith<$Res> {
  _$NotificationPriceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateNotificationPriceImplCopyWith<$Res> {
  factory _$$CreateNotificationPriceImplCopyWith(
          _$CreateNotificationPriceImpl value,
          $Res Function(_$CreateNotificationPriceImpl) then) =
      __$$CreateNotificationPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cryptoId, double price, int idNotification});
}

/// @nodoc
class __$$CreateNotificationPriceImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$CreateNotificationPriceImpl>
    implements _$$CreateNotificationPriceImplCopyWith<$Res> {
  __$$CreateNotificationPriceImplCopyWithImpl(
      _$CreateNotificationPriceImpl _value,
      $Res Function(_$CreateNotificationPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cryptoId = null,
    Object? price = null,
    Object? idNotification = null,
  }) {
    return _then(_$CreateNotificationPriceImpl(
      cryptoId: null == cryptoId
          ? _value.cryptoId
          : cryptoId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      idNotification: null == idNotification
          ? _value.idNotification
          : idNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CreateNotificationPriceImpl implements CreateNotificationPrice {
  const _$CreateNotificationPriceImpl(
      {required this.cryptoId,
      required this.price,
      required this.idNotification});

  @override
  final String cryptoId;
  @override
  final double price;
  @override
  final int idNotification;

  @override
  String toString() {
    return 'NotificationPriceEvent.createNotificationPrice(cryptoId: $cryptoId, price: $price, idNotification: $idNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotificationPriceImpl &&
            (identical(other.cryptoId, cryptoId) ||
                other.cryptoId == cryptoId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.idNotification, idNotification) ||
                other.idNotification == idNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cryptoId, price, idNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotificationPriceImplCopyWith<_$CreateNotificationPriceImpl>
      get copyWith => __$$CreateNotificationPriceImplCopyWithImpl<
          _$CreateNotificationPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoId, double price, int idNotification)
        createNotificationPrice,
    required TResult Function(int idNotification) deleteNotificationPrice,
    required TResult Function() getNotificationPrice,
  }) {
    return createNotificationPrice(cryptoId, price, idNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult? Function(int idNotification)? deleteNotificationPrice,
    TResult? Function()? getNotificationPrice,
  }) {
    return createNotificationPrice?.call(cryptoId, price, idNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult Function(int idNotification)? deleteNotificationPrice,
    TResult Function()? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (createNotificationPrice != null) {
      return createNotificationPrice(cryptoId, price, idNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
  }) {
    return createNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
  }) {
    return createNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (createNotificationPrice != null) {
      return createNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class CreateNotificationPrice implements NotificationPriceEvent {
  const factory CreateNotificationPrice(
      {required final String cryptoId,
      required final double price,
      required final int idNotification}) = _$CreateNotificationPriceImpl;

  String get cryptoId;
  double get price;
  int get idNotification;
  @JsonKey(ignore: true)
  _$$CreateNotificationPriceImplCopyWith<_$CreateNotificationPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNotificationPriceImplCopyWith<$Res> {
  factory _$$DeleteNotificationPriceImplCopyWith(
          _$DeleteNotificationPriceImpl value,
          $Res Function(_$DeleteNotificationPriceImpl) then) =
      __$$DeleteNotificationPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int idNotification});
}

/// @nodoc
class __$$DeleteNotificationPriceImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$DeleteNotificationPriceImpl>
    implements _$$DeleteNotificationPriceImplCopyWith<$Res> {
  __$$DeleteNotificationPriceImplCopyWithImpl(
      _$DeleteNotificationPriceImpl _value,
      $Res Function(_$DeleteNotificationPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idNotification = null,
  }) {
    return _then(_$DeleteNotificationPriceImpl(
      null == idNotification
          ? _value.idNotification
          : idNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteNotificationPriceImpl implements DeleteNotificationPrice {
  const _$DeleteNotificationPriceImpl(this.idNotification);

  @override
  final int idNotification;

  @override
  String toString() {
    return 'NotificationPriceEvent.deleteNotificationPrice(idNotification: $idNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationPriceImpl &&
            (identical(other.idNotification, idNotification) ||
                other.idNotification == idNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotificationPriceImplCopyWith<_$DeleteNotificationPriceImpl>
      get copyWith => __$$DeleteNotificationPriceImplCopyWithImpl<
          _$DeleteNotificationPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoId, double price, int idNotification)
        createNotificationPrice,
    required TResult Function(int idNotification) deleteNotificationPrice,
    required TResult Function() getNotificationPrice,
  }) {
    return deleteNotificationPrice(idNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult? Function(int idNotification)? deleteNotificationPrice,
    TResult? Function()? getNotificationPrice,
  }) {
    return deleteNotificationPrice?.call(idNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult Function(int idNotification)? deleteNotificationPrice,
    TResult Function()? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (deleteNotificationPrice != null) {
      return deleteNotificationPrice(idNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
  }) {
    return deleteNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
  }) {
    return deleteNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (deleteNotificationPrice != null) {
      return deleteNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class DeleteNotificationPrice implements NotificationPriceEvent {
  const factory DeleteNotificationPrice(final int idNotification) =
      _$DeleteNotificationPriceImpl;

  int get idNotification;
  @JsonKey(ignore: true)
  _$$DeleteNotificationPriceImplCopyWith<_$DeleteNotificationPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetNotificationPriceImplCopyWith<$Res> {
  factory _$$GetNotificationPriceImplCopyWith(_$GetNotificationPriceImpl value,
          $Res Function(_$GetNotificationPriceImpl) then) =
      __$$GetNotificationPriceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationPriceImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$GetNotificationPriceImpl>
    implements _$$GetNotificationPriceImplCopyWith<$Res> {
  __$$GetNotificationPriceImplCopyWithImpl(_$GetNotificationPriceImpl _value,
      $Res Function(_$GetNotificationPriceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetNotificationPriceImpl implements GetNotificationPrice {
  const _$GetNotificationPriceImpl();

  @override
  String toString() {
    return 'NotificationPriceEvent.getNotificationPrice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationPriceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoId, double price, int idNotification)
        createNotificationPrice,
    required TResult Function(int idNotification) deleteNotificationPrice,
    required TResult Function() getNotificationPrice,
  }) {
    return getNotificationPrice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult? Function(int idNotification)? deleteNotificationPrice,
    TResult? Function()? getNotificationPrice,
  }) {
    return getNotificationPrice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoId, double price, int idNotification)?
        createNotificationPrice,
    TResult Function(int idNotification)? deleteNotificationPrice,
    TResult Function()? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (getNotificationPrice != null) {
      return getNotificationPrice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
  }) {
    return getNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
  }) {
    return getNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    required TResult orElse(),
  }) {
    if (getNotificationPrice != null) {
      return getNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class GetNotificationPrice implements NotificationPriceEvent {
  const factory GetNotificationPrice() = _$GetNotificationPriceImpl;
}

/// @nodoc
mixin _$NotificationPriceState {
  List<NotificationPrice> get notifications =>
      throw _privateConstructorUsedError;
  Either<CryptoError, Success> get successOrFail =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationPriceStateCopyWith<NotificationPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPriceStateCopyWith<$Res> {
  factory $NotificationPriceStateCopyWith(NotificationPriceState value,
          $Res Function(NotificationPriceState) then) =
      _$NotificationPriceStateCopyWithImpl<$Res, NotificationPriceState>;
  @useResult
  $Res call(
      {List<NotificationPrice> notifications,
      Either<CryptoError, Success> successOrFail});
}

/// @nodoc
class _$NotificationPriceStateCopyWithImpl<$Res,
        $Val extends NotificationPriceState>
    implements $NotificationPriceStateCopyWith<$Res> {
  _$NotificationPriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? successOrFail = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationPrice>,
      successOrFail: null == successOrFail
          ? _value.successOrFail
          : successOrFail // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPriceStateImplCopyWith<$Res>
    implements $NotificationPriceStateCopyWith<$Res> {
  factory _$$NotificationPriceStateImplCopyWith(
          _$NotificationPriceStateImpl value,
          $Res Function(_$NotificationPriceStateImpl) then) =
      __$$NotificationPriceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NotificationPrice> notifications,
      Either<CryptoError, Success> successOrFail});
}

/// @nodoc
class __$$NotificationPriceStateImplCopyWithImpl<$Res>
    extends _$NotificationPriceStateCopyWithImpl<$Res,
        _$NotificationPriceStateImpl>
    implements _$$NotificationPriceStateImplCopyWith<$Res> {
  __$$NotificationPriceStateImplCopyWithImpl(
      _$NotificationPriceStateImpl _value,
      $Res Function(_$NotificationPriceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? successOrFail = null,
  }) {
    return _then(_$NotificationPriceStateImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationPrice>,
      successOrFail: null == successOrFail
          ? _value.successOrFail
          : successOrFail // ignore: cast_nullable_to_non_nullable
              as Either<CryptoError, Success>,
    ));
  }
}

/// @nodoc

class _$NotificationPriceStateImpl implements _NotificationPriceState {
  const _$NotificationPriceStateImpl(
      {required final List<NotificationPrice> notifications,
      required this.successOrFail})
      : _notifications = notifications;

  final List<NotificationPrice> _notifications;
  @override
  List<NotificationPrice> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final Either<CryptoError, Success> successOrFail;

  @override
  String toString() {
    return 'NotificationPriceState(notifications: $notifications, successOrFail: $successOrFail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPriceStateImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.successOrFail, successOrFail) ||
                other.successOrFail == successOrFail));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_notifications), successOrFail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPriceStateImplCopyWith<_$NotificationPriceStateImpl>
      get copyWith => __$$NotificationPriceStateImplCopyWithImpl<
          _$NotificationPriceStateImpl>(this, _$identity);
}

abstract class _NotificationPriceState implements NotificationPriceState {
  const factory _NotificationPriceState(
          {required final List<NotificationPrice> notifications,
          required final Either<CryptoError, Success> successOrFail}) =
      _$NotificationPriceStateImpl;

  @override
  List<NotificationPrice> get notifications;
  @override
  Either<CryptoError, Success> get successOrFail;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPriceStateImplCopyWith<_$NotificationPriceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
