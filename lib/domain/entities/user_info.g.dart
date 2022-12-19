// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserInfo> _$userInfoSerializer = new _$UserInfoSerializer();

class _$UserInfoSerializer implements StructuredSerializer<UserInfo> {
  @override
  final Iterable<Type> types = const [UserInfo, _$UserInfo];
  @override
  final String wireName = 'UserInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserInfo extends UserInfo {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String photoUrl;

  factory _$UserInfo([void Function(UserInfoBuilder)? updates]) =>
      (new UserInfoBuilder()..update(updates))._build();

  _$UserInfo._(
      {required this.uid,
      required this.displayName,
      required this.email,
      required this.photoUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, r'UserInfo', 'uid');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'UserInfo', 'displayName');
    BuiltValueNullFieldError.checkNotNull(email, r'UserInfo', 'email');
    BuiltValueNullFieldError.checkNotNull(photoUrl, r'UserInfo', 'photoUrl');
  }

  @override
  UserInfo rebuild(void Function(UserInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserInfoBuilder toBuilder() => new UserInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfo &&
        uid == other.uid &&
        displayName == other.displayName &&
        email == other.email &&
        photoUrl == other.photoUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uid.hashCode), displayName.hashCode), email.hashCode),
        photoUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserInfo')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('email', email)
          ..add('photoUrl', photoUrl))
        .toString();
  }
}

class UserInfoBuilder implements Builder<UserInfo, UserInfoBuilder> {
  _$UserInfo? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  UserInfoBuilder();

  UserInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _displayName = $v.displayName;
      _email = $v.email;
      _photoUrl = $v.photoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserInfo;
  }

  @override
  void update(void Function(UserInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserInfo build() => _build();

  _$UserInfo _build() {
    final _$result = _$v ??
        new _$UserInfo._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, r'UserInfo', 'uid'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'UserInfo', 'displayName'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'UserInfo', 'email'),
            photoUrl: BuiltValueNullFieldError.checkNotNull(
                photoUrl, r'UserInfo', 'photoUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
