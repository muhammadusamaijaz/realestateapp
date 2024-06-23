import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/builders/consumers/consumer_with_state.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/dashboard_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/dashboard/bottom_nav/dashboard_bottom_nav.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/dashboard/bottom_nav_item/bottom_nav_item.dart';

class DashboardScreen extends StatelessWidget {
  final AppUIParams appUIParams;
  final Widget child;

  const DashboardScreen(
      {super.key, required this.appUIParams, required this.child});

  @override
  Widget build(BuildContext context) {
    return ConsumerWithState<DashboardViewModel>(
        onInit: (viewModel) => viewModel.onInit(),
        builder: (context, viewModel, _) => Stack(
              fit: StackFit.expand,
              children: [
                child,

                ///
                /// Dashboard Bottom Nav Bar
                ///
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.isBottomNavAnimatedStarted,
                  builder: (context, isBottomNavAnimatedStarted, _) =>
                      AnimatedPositioned(
                          bottom: isBottomNavAnimatedStarted ? 20 : -100,
                          left: 30.w,
                          right: 30.w,
                          duration: const Duration(seconds: 2),
                          child: Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: "#26252A".toColor,
                                borderRadius: BorderRadius.circular(50.r)),
                            child: ValueListenableBuilder<
                                List<DashboardBottomNav>>(
                              valueListenable:
                                  viewModel.dashboardBottomNavItems,
                              builder: (context, bottomNavItems, _) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    bottomNavItems.length,
                                    (index) => GestureDetector(
                                          onTap: () =>
                                              viewModel.onNavItemChanged(
                                                  bottomNavItems[index]),
                                          child: BottomNavItem(
                                              bottomNav: bottomNavItems[index]),
                                        )),
                              ),
                            ),
                          )),
                )
              ],
            ));
  }
}
