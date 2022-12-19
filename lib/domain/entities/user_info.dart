import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:defi/domain/entities/serializers.dart';

part 'user_info.g.dart';

abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {
  UserInfo._();
  factory UserInfo([void Function(UserInfoBuilder)? updates]) = _$UserInfo;
  String get uid;
  String get displayName;
  String get email;
  String get photoUrl;

  String toJson() {
    return json.encode(serializers.serializeWith(UserInfo.serializer, this));
  }

  static UserInfo? fromJson(Map<String, dynamic> data) {
    return serializers.deserializeWith(UserInfo.serializer, data);
  }

  static Serializer<UserInfo> get serializer => _$userInfoSerializer;
}
