import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

///
/// [ScreenUtil] is a base class for tracking screen utils like screen width,
/// height, scaled width and height, orientation etc.
///
/// [orientation] is containing current orientation of device.
///
/// [height] is containing current height of device.
///
/// [width] is containing current width of device.
///
/// [setScreenSize] is a helper method that will update all utils of
/// [ScreenUtil] class.
///
/// [scaleHeight] is a getter which will give scaled height against a number.
///
/// [scaleWidth] is a getter which will give scaled width against a number.
///
/// [setHeight] will give proportioned height with scaled height.
///
/// [setWidth] will give proportioned width with scaled width.
///
/// [radius] will give proportioned radius with scaled radius.
///
@singleton
class ScreenUtil {
  late Size uiSize;

  late Orientation orientation;

  late double height;

  late double width;

  ///
  /// this method will update all utils of ScreenUtil class.
  ///
  /// [constraints] will be used to determine width and height of the device.
  ///
  /// [orientation] will be used to determine orientation of current device.
  ///
  void setScreenSize(
      {required BoxConstraints constraints,
      required Orientation orientation,
      required BoxConstraints layoutBuilderConstraints}) {
    this.orientation = orientation;
    height = layoutBuilderConstraints.maxHeight;
    width = layoutBuilderConstraints.maxWidth;
    uiSize = Size(width, height);
  }

  ///
  /// [scaleHeight] will be used to get proportional height for a particular
  /// number against [uiSize]'s height.
  ///
  double get scaleHeight => height / uiSize.height;

  ///
  /// [scaleWidth] will be used to get proportional height for a particular
  /// number against [uiSize]'s width.
  ///
  double get scaleWidth => width / uiSize.width;

  ///
  /// [setHeight] will be used to get proportional height using [scaleHeight]
  ///
  double setHeight(num height) => height * scaleHeight;

  ///
  /// [setWidth] will be used to get proportional height using [scaleWidth]
  ///
  double setWidth(num width) => width * scaleWidth;

  ///
  /// [radius] will be used to get proportional radius
  ///
  double radius(num r) => r * min(scaleWidth, scaleHeight);
}
