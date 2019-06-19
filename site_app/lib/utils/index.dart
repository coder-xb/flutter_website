import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

// 颜色转换
Color str2Color(String colorStr) {
  int val = 0x00000000;
  if (isNotEmpty(colorStr)) {
    if (colorStr[0] == '#') colorStr = colorStr.substring(1);
    val = int.tryParse(colorStr, radix: 16);
    if (val != null && val < 0xffffffff) val += 0xff000000;
  }
  return Color(val);
}
