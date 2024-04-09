import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'media/media.dart';

class MediaScreen {
  static void media() {
    if (SizeScreen.extraLarge) {
    } else if (SizeScreen.large) {
    } else if (SizeScreen.meduim) {
    } else if (SizeScreen.small) {
    }
    else if(SizeScreen.extraSmall){
    }
    // Very Extra Small Screen
    else {
      Media.height = 186.h;
    }
  }
}

class SizeScreen {
  static final bool veryExtraSmall =  ScreenUtil().screenWidth < 376; 
  static final bool extraSmall = ScreenUtil().screenWidth >= 376;
  static final bool small = ScreenUtil().screenWidth >= 576;
  static final bool meduim = ScreenUtil().screenWidth >= 768;
  static final bool large = ScreenUtil().screenWidth >= 992;
  static final bool extraLarge = ScreenUtil().screenWidth >= 1200;
}
