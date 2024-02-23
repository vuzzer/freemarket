import 'package:defi/core/enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utils_type.freezed.dart';

// For notification
@freezed
class Alert with _$Alert {
  const factory Alert(
      {required String title,
      required String desc,
      required String image,
      required AlertValue value,
      @Default(false) bool disable,
      IconData? icon}) = _Alert;
}

// Indicate message error to user
class CryptoError {
  String message;
  CryptoError(this.message);
}

// Mark success
class Success {}

// TimeFrame expression

@freezed
class TimeFrame with _$TimeFrame {
  const factory TimeFrame(
      {required String title,
      required String desc,
      required String cron,
      @Default(false) bool value}) = _TimeFrame;
}
