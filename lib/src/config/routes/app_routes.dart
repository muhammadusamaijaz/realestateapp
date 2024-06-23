import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_screen.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_screen.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/splash/splash_screen.dart';

part 'app_routes.g.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

/// ----------------------------------------------------------------------------
/// DashboardScreen Route
/// ----------------------------------------------------------------------------
@TypedGoRoute<SplashScreenRoute>(path: '/', name: SplashScreen.name)
class SplashScreenRoute extends GoRouteData {
  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage(
          child: SplashScreen(appUIParams: injector()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
                opacity: animation,
                child: child,
              ));
}

/// ----------------------------------------------------------------------------
/// DashboardScreen Route
/// [DashboardShellRoute]
/// [HomeScreenRoute]
/// [MapSearchScreenRoute]
/// ----------------------------------------------------------------------------
@TypedShellRoute<DashboardShellRoute>(routes: [
  TypedGoRoute<HomeScreenRoute>(path: "/home", name: HomeScreen.name),
  TypedGoRoute<MapSearchScreenRoute>(
      path: "/mapSearch", name: MapSearchScreen.name),
])
class DashboardShellRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Widget builder(context, state, navigator) =>
      DashboardScreen(appUIParams: injector(), child: navigator);
}

class HomeScreenRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(
          key: state.pageKey, child: HomeScreen(appUIParams: injector()));
}

class MapSearchScreenRoute extends GoRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage(
          child: MapSearchScreen(appUIParams: injector()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child));
}
