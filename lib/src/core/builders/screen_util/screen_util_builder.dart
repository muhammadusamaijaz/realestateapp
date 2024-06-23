import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/utils/screen_util/screen_util.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';

import '../../typedefs/typedefs.dart';

///
/// [ScreenUtilBuilder] is a base class for getting screen utils from screen
/// using [LayoutBuilder]
///
/// [ScreenUtilResponsiveBuilder] is a callback which will return [Widget]
/// and take [BuildContext] as a parameter.
///
/// [designSize] is a custom size which will be treated as a screen size if not
/// null
///
class ScreenUtilBuilder extends StatelessWidget {
  final ScreenUtilResponsiveBuilder builder;
  final Size? designSize;

  const ScreenUtilBuilder({super.key, required this.builder, this.designSize});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        ///
        /// setting screen size for future use.
        ///
        injector<ScreenUtil>().setScreenSize(
            constraints:

                ///
                /// if design size is null, then [LayoutBuilder]'s constraints will
                /// be used else design size's constraints will be used.
                ///
                designSize == null
                    ? constraints
                    : BoxConstraints(
                        maxWidth: designSize!.width,
                        maxHeight: designSize!.height),
            orientation: orientation,
            layoutBuilderConstraints: constraints);

        ///
        /// After setting constraints, return builder widget.
        ///
        return builder(context);
      });
    });
  }
}
