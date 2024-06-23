import 'package:flutter/cupertino.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/dashboard_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/home/available_hotels/available_hotels.dart';

class HomeViewModel with ChangeNotifier {
  /// --------------------------------------------------------------------------
  /// APP BAR LOCATION ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> locationBoxAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> locationBoxChildTextAnimationStarted =
      ValueNotifier(false);
  ValueNotifier<bool> appBarProfileAvatarAnimationStarted =
      ValueNotifier(false);

  /// --------------------------------------------------------------------------
  /// INTRO ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> hiNameAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> mainIntroTextAnimationStarted = ValueNotifier(false);

  /// --------------------------------------------------------------------------
  /// STATS ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> statsAnimationStarted = ValueNotifier(false);
  ValueNotifier<int> buyStatsValue = ValueNotifier(0);

  /// --------------------------------------------------------------------------
  /// AVAILABLE HOTELS ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> availableHotelsAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> hotelNameAnimationStarted = ValueNotifier(false);
  List<AvailableHotels> availableHotelsList = List.empty(growable: true);

  void onReady() {
    locationBoxAnimationStarted.value = true;
    appBarProfileAvatarAnimationStarted.value = true;
    addAvailableHotels();
  }

  void startLocationBoxChildTextAnimation() {
    locationBoxChildTextAnimationStarted.value = true;
  }

  void startHiNameTextAnimation() {
    hiNameAnimationStarted.value = true;
  }

  void startRelevantAnimationsAfterLoadingHiName() {
    startMainIntroTextAnimation();
    startStatsAnimation();
  }

  void startMainIntroTextAnimation() {
    mainIntroTextAnimationStarted.value = true;
  }

  void startStatsAnimation() {
    statsAnimationStarted.value = true;
    startIncrementingBuyStatValues();
  }

  void startIncrementingBuyStatValues() async {
    for (int i = 1; i < 1050; i = i + 10) {
      buyStatsValue.value = i;
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  void startAvailableHotelsAnimation() {
    availableHotelsAnimationStarted.value = true;
  }

  void addAvailableHotels() {
    availableHotelsList = [
      AvailableHotels(
          hotelImagePath: injector<AppAssets>().availableHotel1Jpg,
          hotelName: "Gladkova St., 25"),
      AvailableHotels(
          hotelImagePath: injector<AppAssets>().availableHotel2Jpg,
          hotelName: "Gubina St., 11"),
      AvailableHotels(
          hotelImagePath: injector<AppAssets>().availableHotel3Jpg,
          hotelName: "Trefoleva St., 43"),
      AvailableHotels(
          hotelImagePath: injector<AppAssets>().availableHotel4Jpg,
          hotelName: "Sedova St., 22"),
    ];
  }

  int getMainAxisCellCountForAvailableHotels(int index) {
    switch (index) {
      case 0:
        return 1;
      case 1:
        return 2;
      case 2:
        return 1;
      case 3:
        return 1;
      default:
        return 1;
    }
  }

  int getCrossAxisCellCountForAvailableHotels(int index) {
    switch (index) {
      case 0:
        return 2;
      case 1:
        return 1;
      case 2:
        return 1;
      case 3:
        return 1;
      default:
        return 1;
    }
  }

  void startHotelNamesAnimation() {
    hotelNameAnimationStarted.value = true;
  }

  void startDashboardBottomNavItemAnimation() {
    DashboardViewModel.of(listen: false).startBottomNavAnimation();
  }
}
