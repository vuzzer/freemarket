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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
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
  $Res call({NotificationCrypto notification});
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
    Object? notification = null,
  }) {
    return _then(_$CreateNotificationPriceImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationCrypto,
    ));
  }
}

/// @nodoc

class _$CreateNotificationPriceImpl implements CreateNotificationPrice {
  const _$CreateNotificationPriceImpl(this.notification);

  @override
  final NotificationCrypto notification;

  @override
  String toString() {
    return 'NotificationPriceEvent.createNotificationPrice(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotificationPriceImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotificationPriceImplCopyWith<_$CreateNotificationPriceImpl>
      get copyWith => __$$CreateNotificationPriceImplCopyWithImpl<
          _$CreateNotificationPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) {
    return createNotificationPrice(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) {
    return createNotificationPrice?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (createNotificationPrice != null) {
      return createNotificationPrice(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) {
    return createNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) {
    return createNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (createNotificationPrice != null) {
      return createNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class CreateNotificationPrice implements NotificationPriceEvent {
  const factory CreateNotificationPrice(final NotificationCrypto notification) =
      _$CreateNotificationPriceImpl;

  NotificationCrypto get notification;
  @JsonKey(ignore: true)
  _$$CreateNotificationPriceImplCopyWith<_$CreateNotificationPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNotificationPriceImplCopyWith<$Res> {
  factory _$$UpdateNotificationPriceImplCopyWith(
          _$UpdateNotificationPriceImpl value,
          $Res Function(_$UpdateNotificationPriceImpl) then) =
      __$$UpdateNotificationPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationCrypto notification});
}

/// @nodoc
class __$$UpdateNotificationPriceImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$UpdateNotificationPriceImpl>
    implements _$$UpdateNotificationPriceImplCopyWith<$Res> {
  __$$UpdateNotificationPriceImplCopyWithImpl(
      _$UpdateNotificationPriceImpl _value,
      $Res Function(_$UpdateNotificationPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$UpdateNotificationPriceImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationCrypto,
    ));
  }
}

/// @nodoc

class _$UpdateNotificationPriceImpl implements UpdateNotificationPrice {
  const _$UpdateNotificationPriceImpl(this.notification);

  @override
  final NotificationCrypto notification;

  @override
  String toString() {
    return 'NotificationPriceEvent.updateNotificationPrice(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationPriceImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNotificationPriceImplCopyWith<_$UpdateNotificationPriceImpl>
      get copyWith => __$$UpdateNotificationPriceImplCopyWithImpl<
          _$UpdateNotificationPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) {
    return updateNotificationPrice(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) {
    return updateNotificationPrice?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (updateNotificationPrice != null) {
      return updateNotificationPrice(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) {
    return updateNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) {
    return updateNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (updateNotificationPrice != null) {
      return updateNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class UpdateNotificationPrice implements NotificationPriceEvent {
  const factory UpdateNotificationPrice(final NotificationCrypto notification) =
      _$UpdateNotificationPriceImpl;

  NotificationCrypto get notification;
  @JsonKey(ignore: true)
  _$$UpdateNotificationPriceImplCopyWith<_$UpdateNotificationPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNotificationPriceImplCopyWith<$Res> {
  factory _$$DeleteNotificationPriceImplCopyWith(
          _$DeleteNotificationPriceImpl value,
          $Res Function(_$DeleteNotificationPriceImpl) then) =
      __$$DeleteNotificationPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cryptoId, int idNotification});
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
    Object? cryptoId = null,
    Object? idNotification = null,
  }) {
    return _then(_$DeleteNotificationPriceImpl(
      null == cryptoId
          ? _value.cryptoId
          : cryptoId // ignore: cast_nullable_to_non_nullable
              as String,
      null == idNotification
          ? _value.idNotification
          : idNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteNotificationPriceImpl implements DeleteNotificationPrice {
  const _$DeleteNotificationPriceImpl(this.cryptoId, this.idNotification);

  @override
  final String cryptoId;
  @override
  final int idNotification;

  @override
  String toString() {
    return 'NotificationPriceEvent.deleteNotificationPrice(cryptoId: $cryptoId, idNotification: $idNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNotificationPriceImpl &&
            (identical(other.cryptoId, cryptoId) ||
                other.cryptoId == cryptoId) &&
            (identical(other.idNotification, idNotification) ||
                other.idNotification == idNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cryptoId, idNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNotificationPriceImplCopyWith<_$DeleteNotificationPriceImpl>
      get copyWith => __$$DeleteNotificationPriceImplCopyWithImpl<
          _$DeleteNotificationPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) {
    return deleteNotificationPrice(cryptoId, idNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) {
    return deleteNotificationPrice?.call(cryptoId, idNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (deleteNotificationPrice != null) {
      return deleteNotificationPrice(cryptoId, idNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) {
    return deleteNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) {
    return deleteNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (deleteNotificationPrice != null) {
      return deleteNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class DeleteNotificationPrice implements NotificationPriceEvent {
  const factory DeleteNotificationPrice(
          final String cryptoId, final int idNotification) =
      _$DeleteNotificationPriceImpl;

  String get cryptoId;
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
  @useResult
  $Res call({String cryptoId});
}

/// @nodoc
class __$$GetNotificationPriceImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$GetNotificationPriceImpl>
    implements _$$GetNotificationPriceImplCopyWith<$Res> {
  __$$GetNotificationPriceImplCopyWithImpl(_$GetNotificationPriceImpl _value,
      $Res Function(_$GetNotificationPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cryptoId = null,
  }) {
    return _then(_$GetNotificationPriceImpl(
      null == cryptoId
          ? _value.cryptoId
          : cryptoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetNotificationPriceImpl implements GetNotificationPrice {
  const _$GetNotificationPriceImpl(this.cryptoId);

  @override
  final String cryptoId;

  @override
  String toString() {
    return 'NotificationPriceEvent.getNotificationPrice(cryptoId: $cryptoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationPriceImpl &&
            (identical(other.cryptoId, cryptoId) ||
                other.cryptoId == cryptoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cryptoId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationPriceImplCopyWith<_$GetNotificationPriceImpl>
      get copyWith =>
          __$$GetNotificationPriceImplCopyWithImpl<_$GetNotificationPriceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) {
    return getNotificationPrice(cryptoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) {
    return getNotificationPrice?.call(cryptoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (getNotificationPrice != null) {
      return getNotificationPrice(cryptoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) {
    return getNotificationPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) {
    return getNotificationPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (getNotificationPrice != null) {
      return getNotificationPrice(this);
    }
    return orElse();
  }
}

abstract class GetNotificationPrice implements NotificationPriceEvent {
  const factory GetNotificationPrice(final String cryptoId) =
      _$GetNotificationPriceImpl;

  String get cryptoId;
  @JsonKey(ignore: true)
  _$$GetNotificationPriceImplCopyWith<_$GetNotificationPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateNotificationFromListImplCopyWith<$Res> {
  factory _$$CreateNotificationFromListImplCopyWith(
          _$CreateNotificationFromListImpl value,
          $Res Function(_$CreateNotificationFromListImpl) then) =
      __$$CreateNotificationFromListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationCrypto> createNotification});
}

/// @nodoc
class __$$CreateNotificationFromListImplCopyWithImpl<$Res>
    extends _$NotificationPriceEventCopyWithImpl<$Res,
        _$CreateNotificationFromListImpl>
    implements _$$CreateNotificationFromListImplCopyWith<$Res> {
  __$$CreateNotificationFromListImplCopyWithImpl(
      _$CreateNotificationFromListImpl _value,
      $Res Function(_$CreateNotificationFromListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createNotification = null,
  }) {
    return _then(_$CreateNotificationFromListImpl(
      null == createNotification
          ? _value._createNotification
          : createNotification // ignore: cast_nullable_to_non_nullable
              as List<NotificationCrypto>,
    ));
  }
}

/// @nodoc

class _$CreateNotificationFromListImpl implements CreateNotificationFromList {
  const _$CreateNotificationFromListImpl(
      final List<NotificationCrypto> createNotification)
      : _createNotification = createNotification;

  final List<NotificationCrypto> _createNotification;
  @override
  List<NotificationCrypto> get createNotification {
    if (_createNotification is EqualUnmodifiableListView)
      return _createNotification;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_createNotification);
  }

  @override
  String toString() {
    return 'NotificationPriceEvent.createNotificationFromList(createNotification: $createNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNotificationFromListImpl &&
            const DeepCollectionEquality()
                .equals(other._createNotification, _createNotification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_createNotification));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNotificationFromListImplCopyWith<_$CreateNotificationFromListImpl>
      get copyWith => __$$CreateNotificationFromListImplCopyWithImpl<
          _$CreateNotificationFromListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationCrypto notification)
        createNotificationPrice,
    required TResult Function(NotificationCrypto notification)
        updateNotificationPrice,
    required TResult Function(String cryptoId, int idNotification)
        deleteNotificationPrice,
    required TResult Function(String cryptoId) getNotificationPrice,
    required TResult Function(List<NotificationCrypto> createNotification)
        createNotificationFromList,
  }) {
    return createNotificationFromList(createNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotificationCrypto notification)? createNotificationPrice,
    TResult? Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult? Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult? Function(String cryptoId)? getNotificationPrice,
    TResult? Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
  }) {
    return createNotificationFromList?.call(createNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationCrypto notification)? createNotificationPrice,
    TResult Function(NotificationCrypto notification)? updateNotificationPrice,
    TResult Function(String cryptoId, int idNotification)?
        deleteNotificationPrice,
    TResult Function(String cryptoId)? getNotificationPrice,
    TResult Function(List<NotificationCrypto> createNotification)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (createNotificationFromList != null) {
      return createNotificationFromList(createNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateNotificationPrice value)
        createNotificationPrice,
    required TResult Function(UpdateNotificationPrice value)
        updateNotificationPrice,
    required TResult Function(DeleteNotificationPrice value)
        deleteNotificationPrice,
    required TResult Function(GetNotificationPrice value) getNotificationPrice,
    required TResult Function(CreateNotificationFromList value)
        createNotificationFromList,
  }) {
    return createNotificationFromList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult? Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult? Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult? Function(GetNotificationPrice value)? getNotificationPrice,
    TResult? Function(CreateNotificationFromList value)?
        createNotificationFromList,
  }) {
    return createNotificationFromList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateNotificationPrice value)? createNotificationPrice,
    TResult Function(UpdateNotificationPrice value)? updateNotificationPrice,
    TResult Function(DeleteNotificationPrice value)? deleteNotificationPrice,
    TResult Function(GetNotificationPrice value)? getNotificationPrice,
    TResult Function(CreateNotificationFromList value)?
        createNotificationFromList,
    required TResult orElse(),
  }) {
    if (createNotificationFromList != null) {
      return createNotificationFromList(this);
    }
    return orElse();
  }
}

abstract class CreateNotificationFromList implements NotificationPriceEvent {
  const factory CreateNotificationFromList(
          final List<NotificationCrypto> createNotification) =
      _$CreateNotificationFromListImpl;

  List<NotificationCrypto> get createNotification;
  @JsonKey(ignore: true)
  _$$CreateNotificationFromListImplCopyWith<_$CreateNotificationFromListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationPriceState {
  bool get loading => throw _privateConstructorUsedError;
  List<NotificationCrypto> get notifications =>
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
      {bool loading,
      List<NotificationCrypto> notifications,
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
    Object? loading = null,
    Object? notifications = null,
    Object? successOrFail = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationCrypto>,
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
      {bool loading,
      List<NotificationCrypto> notifications,
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
    Object? loading = null,
    Object? notifications = null,
    Object? successOrFail = null,
  }) {
    return _then(_$NotificationPriceStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationCrypto>,
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
      {required this.loading,
      required final List<NotificationCrypto> notifications,
      required this.successOrFail})
      : _notifications = notifications;

  @override
  final bool loading;
  final List<NotificationCrypto> _notifications;
  @override
  List<NotificationCrypto> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final Either<CryptoError, Success> successOrFail;

  @override
  String toString() {
    return 'NotificationPriceState(loading: $loading, notifications: $notifications, successOrFail: $successOrFail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPriceStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.successOrFail, successOrFail) ||
                other.successOrFail == successOrFail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
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
          {required final bool loading,
          required final List<NotificationCrypto> notifications,
          required final Either<CryptoError, Success> successOrFail}) =
      _$NotificationPriceStateImpl;

  @override
  bool get loading;
  @override
  List<NotificationCrypto> get notifications;
  @override
  Either<CryptoError, Success> get successOrFail;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPriceStateImplCopyWith<_$NotificationPriceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
