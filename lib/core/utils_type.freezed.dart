// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utils_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Alert {
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  AlertValue get value => throw _privateConstructorUsedError;
  bool get disable => throw _privateConstructorUsedError;
  IconData? get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call(
      {String title,
      String desc,
      String image,
      AlertValue value,
      bool disable,
      IconData? icon});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
    Object? image = null,
    Object? value = null,
    Object? disable = null,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AlertValue,
      disable: null == disable
          ? _value.disable
          : disable // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String desc,
      String image,
      AlertValue value,
      bool disable,
      IconData? icon});
}

/// @nodoc
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
    Object? image = null,
    Object? value = null,
    Object? disable = null,
    Object? icon = freezed,
  }) {
    return _then(_$AlertImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AlertValue,
      disable: null == disable
          ? _value.disable
          : disable // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ));
  }
}

/// @nodoc

class _$AlertImpl implements _Alert {
  const _$AlertImpl(
      {required this.title,
      required this.desc,
      required this.image,
      required this.value,
      this.disable = false,
      this.icon});

  @override
  final String title;
  @override
  final String desc;
  @override
  final String image;
  @override
  final AlertValue value;
  @override
  @JsonKey()
  final bool disable;
  @override
  final IconData? icon;

  @override
  String toString() {
    return 'Alert(title: $title, desc: $desc, image: $image, value: $value, disable: $disable, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.disable, disable) || other.disable == disable) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, desc, image, value, disable, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);
}

abstract class _Alert implements Alert {
  const factory _Alert(
      {required final String title,
      required final String desc,
      required final String image,
      required final AlertValue value,
      final bool disable,
      final IconData? icon}) = _$AlertImpl;

  @override
  String get title;
  @override
  String get desc;
  @override
  String get image;
  @override
  AlertValue get value;
  @override
  bool get disable;
  @override
  IconData? get icon;
  @override
  @JsonKey(ignore: true)
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimeFrame {
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get cron => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeFrameCopyWith<TimeFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeFrameCopyWith<$Res> {
  factory $TimeFrameCopyWith(TimeFrame value, $Res Function(TimeFrame) then) =
      _$TimeFrameCopyWithImpl<$Res, TimeFrame>;
  @useResult
  $Res call({String title, String desc, String cron, bool value});
}

/// @nodoc
class _$TimeFrameCopyWithImpl<$Res, $Val extends TimeFrame>
    implements $TimeFrameCopyWith<$Res> {
  _$TimeFrameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
    Object? cron = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      cron: null == cron
          ? _value.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeFrameImplCopyWith<$Res>
    implements $TimeFrameCopyWith<$Res> {
  factory _$$TimeFrameImplCopyWith(
          _$TimeFrameImpl value, $Res Function(_$TimeFrameImpl) then) =
      __$$TimeFrameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String desc, String cron, bool value});
}

/// @nodoc
class __$$TimeFrameImplCopyWithImpl<$Res>
    extends _$TimeFrameCopyWithImpl<$Res, _$TimeFrameImpl>
    implements _$$TimeFrameImplCopyWith<$Res> {
  __$$TimeFrameImplCopyWithImpl(
      _$TimeFrameImpl _value, $Res Function(_$TimeFrameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? desc = null,
    Object? cron = null,
    Object? value = null,
  }) {
    return _then(_$TimeFrameImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      cron: null == cron
          ? _value.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimeFrameImpl implements _TimeFrame {
  const _$TimeFrameImpl(
      {required this.title,
      required this.desc,
      required this.cron,
      this.value = false});

  @override
  final String title;
  @override
  final String desc;
  @override
  final String cron;
  @override
  @JsonKey()
  final bool value;

  @override
  String toString() {
    return 'TimeFrame(title: $title, desc: $desc, cron: $cron, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeFrameImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.cron, cron) || other.cron == cron) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, desc, cron, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeFrameImplCopyWith<_$TimeFrameImpl> get copyWith =>
      __$$TimeFrameImplCopyWithImpl<_$TimeFrameImpl>(this, _$identity);
}

abstract class _TimeFrame implements TimeFrame {
  const factory _TimeFrame(
      {required final String title,
      required final String desc,
      required final String cron,
      final bool value}) = _$TimeFrameImpl;

  @override
  String get title;
  @override
  String get desc;
  @override
  String get cron;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$TimeFrameImplCopyWith<_$TimeFrameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
