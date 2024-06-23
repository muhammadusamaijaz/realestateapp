import 'package:flutter/cupertino.dart';
import 'package:moniepoint_flutter_assessment/src/config/routes/app_routes.dart';

class SplashViewModel with ChangeNotifier {
  void onInit() {
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      HomeScreenRoute().go(navigatorKey.currentState!.context);
    });
  }
}
