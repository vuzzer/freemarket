import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

part 'media/media.dart';

class MediaScreen {
  static void media() {
    if (SizeScreen.extraLarge) {
      Logger().d("extraLarge screen");
    } else if (SizeScreen.large) {
      Logger().d("large screen");
    } else if (SizeScreen.meduim) {
      Logger().d("meduim screen");
    } else if (SizeScreen.small) {
      Logger().d("meduim screen");
    } else {
      Logger().d("extrasmall screen");
    }
  }
}

class SizeScreen {
  static final bool extraSmall = ScreenUtil().screenWidth < 576;
  static final bool small = ScreenUtil().screenWidth >= 576;
  static final bool meduim = ScreenUtil().screenWidth >= 768;
  static final bool large = ScreenUtil().screenWidth >= 992;
  static final bool extraLarge = ScreenUtil().screenWidth >= 1200;
}
