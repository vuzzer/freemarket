// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActiveNotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getActiveNotification,
    required TResult Function(int activeNotification) updateActiveNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getActiveNotification,
    TResult? Function(int activeNotification)? updateActiveNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getActiveNotification,
    TResult Function(int activeNotification)? updateActiveNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetActiveNotification value)
        getActiveNotification,
    required TResult Function(UpdateActiveNotification value)
        updateActiveNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetActiveNotification value)? getActiveNotification,
    TResult? Function(UpdateActiveNotification value)? updateActiveNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetActiveNotification value)? getActiveNotification,
    TResult Function(UpdateActiveNotification value)? updateActiveNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveNotificationEventCopyWith<$Res> {
  factory $ActiveNotificationEventCopyWith(ActiveNotificationEvent value,
          $Res Function(ActiveNotificationEvent) then) =
      _$ActiveNotificationEventCopyWithImpl<$Res, ActiveNotificationEvent>;
}

/// @nodoc
class _$ActiveNotificationEventCopyWithImpl<$Res,
        $Val extends ActiveNotificationEvent>
    implements $ActiveNotificationEventCopyWith<$Res> {
  _$ActiveNotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetActiveNotificationImplCopyWith<$Res> {
  factory _$$GetActiveNotificationImplCopyWith(
          _$GetActiveNotificationImpl value,
          $Res Function(_$GetActiveNotificationImpl) then) =
      __$$GetActiveNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetActiveNotificationImplCopyWithImpl<$Res>
    extends _$ActiveNotificationEventCopyWithImpl<$Res,
        _$GetActiveNotificationImpl>
    implements _$$GetActiveNotificationImplCopyWith<$Res> {
  __$$GetActiveNotificationImplCopyWithImpl(_$GetActiveNotificationImpl _value,
      $Res Function(_$GetActiveNotificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetActiveNotificationImpl implements GetActiveNotification {
  const _$GetActiveNotificationImpl();

  @override
  String toString() {
    return 'ActiveNotificationEvent.getActiveNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetActiveNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getActiveNotification,
    required TResult Function(int activeNotification) updateActiveNotification,
  }) {
    return getActiveNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getActiveNotification,
    TResult? Function(int activeNotification)? updateActiveNotification,
  }) {
    return getActiveNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getActiveNotification,
    TResult Function(int activeNotification)? updateActiveNotification,
    required TResult orElse(),
  }) {
    if (getActiveNotification != null) {
      return getActiveNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetActiveNotification value)
        getActiveNotification,
    required TResult Function(UpdateActiveNotification value)
        updateActiveNotification,
  }) {
    return getActiveNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetActiveNotification value)? getActiveNotification,
    TResult? Function(UpdateActiveNotification value)? updateActiveNotification,
  }) {
    return getActiveNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetActiveNotification value)? getActiveNotification,
    TResult Function(UpdateActiveNotification value)? updateActiveNotification,
    required TResult orElse(),
  }) {
    if (getActiveNotification != null) {
      return getActiveNotification(this);
    }
    return orElse();
  }
}

abstract class GetActiveNotification implements ActiveNotificationEvent {
  const factory GetActiveNotification() = _$GetActiveNotificationImpl;
}

/// @nodoc
abstract class _$$UpdateActiveNotificationImplCopyWith<$Res> {
  factory _$$UpdateActiveNotificationImplCopyWith(
          _$UpdateActiveNotificationImpl value,
          $Res Function(_$UpdateActiveNotificationImpl) then) =
      __$$UpdateActiveNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int activeNotification});
}

/// @nodoc
class __$$UpdateActiveNotificationImplCopyWithImpl<$Res>
    extends _$ActiveNotificationEventCopyWithImpl<$Res,
        _$UpdateActiveNotificationImpl>
    implements _$$UpdateActiveNotificationImplCopyWith<$Res> {
  __$$UpdateActiveNotificationImplCopyWithImpl(
      _$UpdateActiveNotificationImpl _value,
      $Res Function(_$UpdateActiveNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeNotification = null,
  }) {
    return _then(_$UpdateActiveNotificationImpl(
      null == activeNotification
          ? _value.activeNotification
          : activeNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateActiveNotificationImpl implements UpdateActiveNotification {
  const _$UpdateActiveNotificationImpl(this.activeNotification);

  @override
  final int activeNotification;

  @override
  String toString() {
    return 'ActiveNotificationEvent.updateActiveNotification(activeNotification: $activeNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateActiveNotificationImpl &&
            (identical(other.activeNotification, activeNotification) ||
                other.activeNotification == activeNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateActiveNotificationImplCopyWith<_$UpdateActiveNotificationImpl>
      get copyWith => __$$UpdateActiveNotificationImplCopyWithImpl<
          _$UpdateActiveNotificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getActiveNotification,
    required TResult Function(int activeNotification) updateActiveNotification,
  }) {
    return updateActiveNotification(activeNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getActiveNotification,
    TResult? Function(int activeNotification)? updateActiveNotification,
  }) {
    return updateActiveNotification?.call(activeNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getActiveNotification,
    TResult Function(int activeNotification)? updateActiveNotification,
    required TResult orElse(),
  }) {
    if (updateActiveNotification != null) {
      return updateActiveNotification(activeNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetActiveNotification value)
        getActiveNotification,
    required TResult Function(UpdateActiveNotification value)
        updateActiveNotification,
  }) {
    return updateActiveNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetActiveNotification value)? getActiveNotification,
    TResult? Function(UpdateActiveNotification value)? updateActiveNotification,
  }) {
    return updateActiveNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetActiveNotification value)? getActiveNotification,
    TResult Function(UpdateActiveNotification value)? updateActiveNotification,
    required TResult orElse(),
  }) {
    if (updateActiveNotification != null) {
      return updateActiveNotification(this);
    }
    return orElse();
  }
}

abstract class UpdateActiveNotification implements ActiveNotificationEvent {
  const factory UpdateActiveNotification(final int activeNotification) =
      _$UpdateActiveNotificationImpl;

  int get activeNotification;
  @JsonKey(ignore: true)
  _$$UpdateActiveNotificationImplCopyWith<_$UpdateActiveNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ActiveNotificationState {
  int get activeNotification => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActiveNotificationStateCopyWith<ActiveNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveNotificationStateCopyWith<$Res> {
  factory $ActiveNotificationStateCopyWith(ActiveNotificationState value,
          $Res Function(ActiveNotificationState) then) =
      _$ActiveNotificationStateCopyWithImpl<$Res, ActiveNotificationState>;
  @useResult
  $Res call({int activeNotification});
}

/// @nodoc
class _$ActiveNotificationStateCopyWithImpl<$Res,
        $Val extends ActiveNotificationState>
    implements $ActiveNotificationStateCopyWith<$Res> {
  _$ActiveNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeNotification = null,
  }) {
    return _then(_value.copyWith(
      activeNotification: null == activeNotification
          ? _value.activeNotification
          : activeNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveNotificationStateImplCopyWith<$Res>
    implements $ActiveNotificationStateCopyWith<$Res> {
  factory _$$ActiveNotificationStateImplCopyWith(
          _$ActiveNotificationStateImpl value,
          $Res Function(_$ActiveNotificationStateImpl) then) =
      __$$ActiveNotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeNotification});
}

/// @nodoc
class __$$ActiveNotificationStateImplCopyWithImpl<$Res>
    extends _$ActiveNotificationStateCopyWithImpl<$Res,
        _$ActiveNotificationStateImpl>
    implements _$$ActiveNotificationStateImplCopyWith<$Res> {
  __$$ActiveNotificationStateImplCopyWithImpl(
      _$ActiveNotificationStateImpl _value,
      $Res Function(_$ActiveNotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeNotification = null,
  }) {
    return _then(_$ActiveNotificationStateImpl(
      activeNotification: null == activeNotification
          ? _value.activeNotification
          : activeNotification // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ActiveNotificationStateImpl implements _ActiveNotificationState {
  const _$ActiveNotificationStateImpl({required this.activeNotification});

  @override
  final int activeNotification;

  @override
  String toString() {
    return 'ActiveNotificationState(activeNotification: $activeNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveNotificationStateImpl &&
            (identical(other.activeNotification, activeNotification) ||
                other.activeNotification == activeNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveNotificationStateImplCopyWith<_$ActiveNotificationStateImpl>
      get copyWith => __$$ActiveNotificationStateImplCopyWithImpl<
          _$ActiveNotificationStateImpl>(this, _$identity);
}

abstract class _ActiveNotificationState implements ActiveNotificationState {
  const factory _ActiveNotificationState(
      {required final int activeNotification}) = _$ActiveNotificationStateImpl;

  @override
  int get activeNotification;
  @override
  @JsonKey(ignore: true)
  _$$ActiveNotificationStateImplCopyWith<_$ActiveNotificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
