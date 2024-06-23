import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:moniepoint_flutter_assessment/src/config/routes/app_routes.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:provider/provider.dart';

import 'src/config/providers/app_providers.dart';
import 'src/core/builders/screen_util/screen_util_builder.dart';
import 'src/core/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --------------------------------------------------------------------------
  /// [configureDependencies] will configure all dependencies of app
  /// --------------------------------------------------------------------------
  await configureDependencies();

  /// --------------------------------------------------------------------------
  /// change app system navigation bar color & status bar color
  /// --------------------------------------------------------------------------
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffF9F9F9),
      statusBarColor: Colors.transparent));

  /// --------------------------------------------------------------------------
  /// lock screen orientation to the portrait
  /// --------------------------------------------------------------------------
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
      routes: $appRoutes,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: injector<AppProviders>().providers,
      builder: (context, _) => ScreenUtilBuilder(
        designSize: injector<AppConstants>().designSize,
        builder: (context) => MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          title: injector<AppConstants>().appName,
        ),
      ),
    );
  }
}
