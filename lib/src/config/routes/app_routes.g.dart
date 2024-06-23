// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRoute,
      $dashboardShellRoute,
    ];

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/',
      name: 'SPLASH_SCREEN',
      factory: $SplashScreenRouteExtension._fromState,
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dashboardShellRoute => ShellRouteData.$route(
      navigatorKey: DashboardShellRoute.$navigatorKey,
      factory: $DashboardShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home',
          name: 'HOME_SCREEN',
          factory: $HomeScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/mapSearch',
          name: 'MAP_SEARCH_SCREEN',
          factory: $MapSearchScreenRouteExtension._fromState,
        ),
      ],
    );

extension $DashboardShellRouteExtension on DashboardShellRoute {
  static DashboardShellRoute _fromState(GoRouterState state) =>
      DashboardShellRoute();
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MapSearchScreenRouteExtension on MapSearchScreenRoute {
  static MapSearchScreenRoute _fromState(GoRouterState state) =>
      MapSearchScreenRoute();

  String get location => GoRouteData.$location(
        '/mapSearch',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
