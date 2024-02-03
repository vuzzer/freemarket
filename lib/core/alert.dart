import 'package:defi/core/enum.dart';
import 'package:flutter/material.dart';

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