import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

extension StringToColorExtension on String {
  Color get toColor => HexColor(this);
}
