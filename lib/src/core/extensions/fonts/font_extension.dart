import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';

extension Fonts on AppTextStyles {
  static TextStyle currentlyActiveFont(
          {TextStyle? textStyle,
          Color? color,
          Color? backgroundColor,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle,
          double? letterSpacing,
          double? wordSpacing,
          TextBaseline? textBaseline,
          double? height,
          Locale? locale,
          Paint? foreground,
          Paint? background,
          List<ui.Shadow>? shadows,
          List<ui.FontFeature>? fontFeatures,
          TextDecoration? decoration,
          Color? decorationColor,
          TextDecorationStyle? decorationStyle,
          double? decorationThickness}) =>
      GoogleFonts.montserrat(
        color: color,
        textStyle: textStyle,
        height: height,
        background: background,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        backgroundColor: backgroundColor,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFeatures: fontFeatures,
        fontStyle: fontStyle,
        foreground: foreground,
        letterSpacing: letterSpacing,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing,
      );
}
