import 'package:flutter/material.dart';

// double isMobileSize = 900.0;
double isMobileSize = 900.0;
// double isDesktopSize = 1100.0;
double isDesktopSize = 1100.0;

extension SizeApp on MediaQueryData {
  //Desktop
  bool get isDesktopSize => size.width >= 1100;

  //Tablet
  bool get isTabletSize => size.width < 1100 && size.width >= 850;

  //Mobile
  bool get isMobileSize => size.width < 850;
}
