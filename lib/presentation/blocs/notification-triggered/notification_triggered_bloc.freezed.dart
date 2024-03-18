// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_triggered_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationTriggeredEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(Map<dynamic, dynamic> data, int index)
        openNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(Map<dynamic, dynamic> data, int index)? openNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(Map<dynamic, dynamic> data, int index)? openNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAll value) getAll,
    required TResult Function(OpenNotification value) openNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAll value)? getAll,
    TResult? Function(OpenNotification value)? openNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAll value)? getAll,
    TResult Function(OpenNotification value)? openNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTriggeredEventCopyWith<$Res> {
  factory $NotificationTriggeredEventCopyWith(NotificationTriggeredEvent value,
          $Res Function(NotificationTriggeredEvent) then) =
      _$NotificationTriggeredEventCopyWithImpl<$Res,
          NotificationTriggeredEvent>;
}

/// @nodoc
class _$NotificationTriggeredEventCopyWithImpl<$Res,
        $Val extends NotificationTriggeredEvent>
    implements $NotificationTriggeredEventCopyWith<$Res> {
  _$NotificationTriggeredEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllImplCopyWith<$Res> {
  factory _$$GetAllImplCopyWith(
          _$GetAllImpl value, $Res Function(_$GetAllImpl) then) =
      __$$GetAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllImplCopyWithImpl<$Res>
    extends _$NotificationTriggeredEventCopyWithImpl<$Res, _$GetAllImpl>
    implements _$$GetAllImplCopyWith<$Res> {
  __$$GetAllImplCopyWithImpl(
      _$GetAllImpl _value, $Res Function(_$GetAllImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllImpl implements GetAll {
  const _$GetAllImpl();

  @override
  String toString() {
    return 'NotificationTriggeredEvent.getAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(Map<dynamic, dynamic> data, int index)
        openNotification,
  }) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(Map<dynamic, dynamic> data, int index)? openNotification,
  }) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(Map<dynamic, dynamic> data, int index)? openNotification,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAll value) getAll,
    required TResult Function(OpenNotification value) openNotification,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAll value)? getAll,
    TResult? Function(OpenNotification value)? openNotification,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAll value)? getAll,
    TResult Function(OpenNotification value)? openNotification,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class GetAll implements NotificationTriggeredEvent {
  const factory GetAll() = _$GetAllImpl;
}

/// @nodoc
abstract class _$$OpenNotificationImplCopyWith<$Res> {
  factory _$$OpenNotificationImplCopyWith(_$OpenNotificationImpl value,
          $Res Function(_$OpenNotificationImpl) then) =
      __$$OpenNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<dynamic, dynamic> data, int index});
}

/// @nodoc
class __$$OpenNotificationImplCopyWithImpl<$Res>
    extends _$NotificationTriggeredEventCopyWithImpl<$Res,
        _$OpenNotificationImpl>
    implements _$$OpenNotificationImplCopyWith<$Res> {
  __$$OpenNotificationImplCopyWithImpl(_$OpenNotificationImpl _value,
      $Res Function(_$OpenNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? index = null,
  }) {
    return _then(_$OpenNotificationImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OpenNotificationImpl implements OpenNotification {
  const _$OpenNotificationImpl(final Map<dynamic, dynamic> data, this.index)
      : _data = data;

  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final int index;

  @override
  String toString() {
    return 'NotificationTriggeredEvent.openNotification(data: $data, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenNotificationImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenNotificationImplCopyWith<_$OpenNotificationImpl> get copyWith =>
      __$$OpenNotificationImplCopyWithImpl<_$OpenNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAll,
    required TResult Function(Map<dynamic, dynamic> data, int index)
        openNotification,
  }) {
    return openNotification(data, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
    TResult? Function(Map<dynamic, dynamic> data, int index)? openNotification,
  }) {
    return openNotification?.call(data, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    TResult Function(Map<dynamic, dynamic> data, int index)? openNotification,
    required TResult orElse(),
  }) {
    if (openNotification != null) {
      return openNotification(data, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAll value) getAll,
    required TResult Function(OpenNotification value) openNotification,
  }) {
    return openNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAll value)? getAll,
    TResult? Function(OpenNotification value)? openNotification,
  }) {
    return openNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAll value)? getAll,
    TResult Function(OpenNotification value)? openNotification,
    required TResult orElse(),
  }) {
    if (openNotification != null) {
      return openNotification(this);
    }
    return orElse();
  }
}

abstract class OpenNotification implements NotificationTriggeredEvent {
  const factory OpenNotification(
          final Map<dynamic, dynamic> data, final int index) =
      _$OpenNotificationImpl;

  Map<dynamic, dynamic> get data;
  int get index;
  @JsonKey(ignore: true)
  _$$OpenNotificationImplCopyWith<_$OpenNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationTriggeredState {
  List<dynamic> get all => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationTriggeredStateCopyWith<NotificationTriggeredState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTriggeredStateCopyWith<$Res> {
  factory $NotificationTriggeredStateCopyWith(NotificationTriggeredState value,
          $Res Function(NotificationTriggeredState) then) =
      _$NotificationTriggeredStateCopyWithImpl<$Res,
          NotificationTriggeredState>;
  @useResult
  $Res call({List<dynamic> all, bool loading});
}

/// @nodoc
class _$NotificationTriggeredStateCopyWithImpl<$Res,
        $Val extends NotificationTriggeredState>
    implements $NotificationTriggeredStateCopyWith<$Res> {
  _$NotificationTriggeredStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? all = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      all: null == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationTriggeredStateImplCopyWith<$Res>
    implements $NotificationTriggeredStateCopyWith<$Res> {
  factory _$$NotificationTriggeredStateImplCopyWith(
          _$NotificationTriggeredStateImpl value,
          $Res Function(_$NotificationTriggeredStateImpl) then) =
      __$$NotificationTriggeredStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> all, bool loading});
}

/// @nodoc
class __$$NotificationTriggeredStateImplCopyWithImpl<$Res>
    extends _$NotificationTriggeredStateCopyWithImpl<$Res,
        _$NotificationTriggeredStateImpl>
    implements _$$NotificationTriggeredStateImplCopyWith<$Res> {
  __$$NotificationTriggeredStateImplCopyWithImpl(
      _$NotificationTriggeredStateImpl _value,
      $Res Function(_$NotificationTriggeredStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? all = null,
    Object? loading = null,
  }) {
    return _then(_$NotificationTriggeredStateImpl(
      all: null == all
          ? _value._all
          : all // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationTriggeredStateImpl implements _NotificationTriggeredState {
  const _$NotificationTriggeredStateImpl(
      {required final List<dynamic> all, required this.loading})
      : _all = all;

  final List<dynamic> _all;
  @override
  List<dynamic> get all {
    if (_all is EqualUnmodifiableListView) return _all;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_all);
  }

  @override
  final bool loading;

  @override
  String toString() {
    return 'NotificationTriggeredState(all: $all, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationTriggeredStateImpl &&
            const DeepCollectionEquality().equals(other._all, _all) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_all), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationTriggeredStateImplCopyWith<_$NotificationTriggeredStateImpl>
      get copyWith => __$$NotificationTriggeredStateImplCopyWithImpl<
          _$NotificationTriggeredStateImpl>(this, _$identity);
}

abstract class _NotificationTriggeredState
    implements NotificationTriggeredState {
  const factory _NotificationTriggeredState(
      {required final List<dynamic> all,
      required final bool loading}) = _$NotificationTriggeredStateImpl;

  @override
  List<dynamic> get all;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$NotificationTriggeredStateImplCopyWith<_$NotificationTriggeredStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
