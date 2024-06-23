import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/typedefs/typedefs.dart';
import 'package:moniepoint_flutter_assessment/src/core/utils/app_utils/app_utils.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  final Widget? appBar;
  final Color? scaffoldBackgroundColor;
  final Color? appNavigationBarColor;
  final bool useBaseWidgetPadding;
  final bool resizeToAvoidBottomPadding;
  final bool useTopPadding;
  final bool useBottomPadding;
  final OnWillPopCallBack? onPopInvoked;
  final bool canPop;
  final Gradient? gradient;
  final Widget? floatingButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final GlobalKey? scaffoldKey;

  const BaseWidget(
      {super.key,
      required this.child,
      this.appNavigationBarColor,
      this.scaffoldBackgroundColor,
      this.appBar,
      this.onPopInvoked,
      this.canPop = true,
      this.gradient,
      this.drawer,
      this.endDrawer,
      this.useBottomPadding = false,
      this.scaffoldKey,
      this.floatingButton,
      this.useBaseWidgetPadding = true,
      this.useTopPadding = true,
      this.resizeToAvoidBottomPadding = true});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: onPopInvoked,
      canPop: canPop,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton:
            Padding(padding: EdgeInsets.zero, child: floatingButton),
        resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
        drawer: drawer,
        endDrawer: endDrawer,
        body: Container(
          decoration: BoxDecoration(
              gradient: gradient ??
                  LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      "#F9F9F9".toColor,
                      "#F9F9F9".toColor,
                      "#FBE0BF".toColor,
                      "#FBE0BF".toColor,
                      "#F9F9F9".toColor,
                      "#F9F9F9".toColor,
                    ],
                  )),
          child: Column(
            children: [
              if (appBar != null) appBar!,
              Expanded(
                  child: Padding(
                padding: useBaseWidgetPadding
                    ? EdgeInsets.symmetric(
                            horizontal:
                                injector<AppUtils>().getBaseWidgetPadding()) +
                        (useTopPadding
                            ? EdgeInsets.only(top: 36.h)
                            : EdgeInsets.zero) +
                        (useBottomPadding
                            ? EdgeInsets.only(bottom: 40.h)
                            : EdgeInsets.zero)
                    : EdgeInsets.zero,
                child: child,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
