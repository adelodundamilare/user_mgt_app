import 'package:flutter/material.dart';
import 'package:ryalize/utils/constants.dart';

extension RyalizeColorScheme on ColorScheme {
  Color get loginInfoContainer => brightness == Brightness.light
      ? kColorGrey
      : kColorWhite.withOpacity(0.1);
  Color get lightGreyToDark => brightness == Brightness.light
      ? kColorGrey
      : kColorWhite.withOpacity(0.1);
  Color get textColor => brightness == Brightness.light
      ? kColorPrimaryText
      : kColorWhite.withOpacity(0.8);
  Color get primaryToWhite =>
      brightness == Brightness.light ? kColorPrimary : kColorWhite;
  Color get faintGray => brightness == Brightness.light
      ? kColorDarkGrey.withOpacity(0.1)
      : kColorWhite.withOpacity(0.2);
}
