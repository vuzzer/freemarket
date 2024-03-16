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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAll value) getAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAll value)? getAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAll value)? getAll,
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
  }) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAll,
  }) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
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
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAll value)? getAll,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAll value)? getAll,
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
