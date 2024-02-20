import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customBottomSheet(BuildContext context) {
  final size = ScreenUtil();

  showModalBottomSheet(
    context: context,
    elevation: 2,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30), right: Radius.circular(30)) ),
    builder: (context) => Container(
      width: size.screenWidth,
      height: 200,
      decoration: const BoxDecoration(
          color: blue1,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30), right: Radius.circular(30))),
      child: const Center(
        child: Text("Hello"),
      ),
    ),
  );
}
