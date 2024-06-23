import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:moniepoint_flutter_assessment/src/config/routes/app_routes.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_screen.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_screen.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/dashboard/bottom_nav/dashboard_bottom_nav.dart';
import 'package:provider/provider.dart';

class DashboardViewModel with ChangeNotifier {
  ValueNotifier<bool> isBottomNavAnimatedStarted = ValueNotifier(false);
  ValueNotifier<List<DashboardBottomNav>> dashboardBottomNavItems =
      ValueNotifier(List.empty(growable: true));

  void onInit() {
    initializeBottomNavItems();
  }

  void initializeBottomNavItems() {
    dashboardBottomNavItems.value = List.from([
      DashboardBottomNav(
          navItemName: MapSearchScreen.name,
          iconPath: injector<AppAssets>().bottomNavSearchIconPng,
          isSelected: ValueNotifier(false)),
      DashboardBottomNav(
          navItemName: '/chat',
          iconPath: injector<AppAssets>().bottomNavChatIconPng,
          isSelected: ValueNotifier(false)),
      DashboardBottomNav(
          navItemName: HomeScreen.name,
          iconPath: injector<AppAssets>().bottomNavHomeIconPng,
          isSelected: ValueNotifier(true)),
      DashboardBottomNav(
          navItemName: '/heart',
          iconPath: injector<AppAssets>().bottomNavHeartIconPng,
          isSelected: ValueNotifier(false)),
      DashboardBottomNav(
          navItemName: '/profile',
          iconPath: injector<AppAssets>().bottomNavProfileIconPng,
          isSelected: ValueNotifier(false)),
    ]);
  }

  void startBottomNavAnimation() {
    isBottomNavAnimatedStarted.value = true;
  }

  void onNavItemChanged(DashboardBottomNav bottomNav) {
    ///
    /// Get currently selected nav item
    ///
    final currentlySelectedMenuItem = dashboardBottomNavItems.value
        .where((element) => element.isSelected.value == true)
        .firstOrNull;

    ///
    /// check if user is not requesting same nav item to redirect
    ///
    if (bottomNav != currentlySelectedMenuItem) {
      ///
      /// Move to requested route
      ///
      shellNavigatorKey.currentState!.context.goNamed(bottomNav.navItemName);

      ///
      /// Make selection for currently selected nav item
      ///
      dashboardBottomNavItems.value
          .map((element) => element.isSelected.value =
              element.navItemName.toLowerCase() ==
                  bottomNav.navItemName.toLowerCase())
          .toList();
    }
  }

  static DashboardViewModel of({bool listen = true}) {
    return Provider.of<DashboardViewModel>(navigatorKey.currentState!.context,
        listen: listen);
  }
}
