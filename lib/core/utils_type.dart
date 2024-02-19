import 'package:defi/core/enum.dart';
import 'package:flutter/material.dart';

// For notification
class Alert {
  final String title;
  final String desc;
  final String image;
  final IconData? icon;
  final AlertValue value;
  const Alert(
      {required this.title,
      required this.desc,
      required this.image,
      required this.value,
      this.icon});
}

// Indicate message error to user
class CryptoError {
  String message;
  CryptoError(this.message);
}

// Mark success
class Success {}

