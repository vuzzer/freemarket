library serializers;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:defi/domain/entities/user_info.dart';

part 'serializers.g.dart';


@SerializersFor( [
  UserInfo
])
final Serializers serializers =   (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
