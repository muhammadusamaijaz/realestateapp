import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/fonts/font_extension.dart';

@lazySingleton
class AppTextStyles {
  /// --------------------------------------------------------------------------
  /// REGULAR FONTS
  /// --------------------------------------------------------------------------
  final regular14 =
      Fonts.currentlyActiveFont(fontSize: 14, fontWeight: FontWeight.w400);
  final regular18 =
      Fonts.currentlyActiveFont(fontSize: 18, fontWeight: FontWeight.w400);

  /// --------------------------------------------------------------------------
  /// SEMI BOLD FONTS
  /// --------------------------------------------------------------------------
  final semiBold12 =
      Fonts.currentlyActiveFont(fontSize: 12, fontWeight: FontWeight.w500);
  final semiBold14 =
  Fonts.currentlyActiveFont(fontSize: 14, fontWeight: FontWeight.w500);
  final semiBold18 =
      Fonts.currentlyActiveFont(fontSize: 18, fontWeight: FontWeight.w500);
  final semiBold20 =
      Fonts.currentlyActiveFont(fontSize: 20, fontWeight: FontWeight.w500);
  final semiBold24 =
      Fonts.currentlyActiveFont(fontSize: 24, fontWeight: FontWeight.w500);

  /// --------------------------------------------------------------------------
  /// BOLD FONTS
  /// --------------------------------------------------------------------------
  final bold24 =
      Fonts.currentlyActiveFont(fontSize: 24, fontWeight: FontWeight.w600);
}
