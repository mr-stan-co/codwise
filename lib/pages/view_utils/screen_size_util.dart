import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  big;
}

class ScreenSizeUtil {
  static ScreenSize getFromSize(Size size) {
    if (size.width > 1600) {
      return ScreenSize.big;
    } else if (size.width > 1280) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.small;
    }
  }
}
