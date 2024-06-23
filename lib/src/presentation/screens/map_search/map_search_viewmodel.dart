import 'package:flutter/cupertino.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/map_search/markers/map_marker.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/map_search/more_navigation_controls/more_navigation_controls.dart';

class MapSearchViewModel with ChangeNotifier {
  /// --------------------------------------------------------------------------
  /// CONTROLLERS ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> controllerAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> moreNavigationControllersMenuAnimationStarted =
      ValueNotifier(false);
  List<MoreNavigationControls> moreNavigationControlsList =
      List.empty(growable: true);

  /// --------------------------------------------------------------------------
  /// MAP MARKERS ANIMATION FLAGS
  /// --------------------------------------------------------------------------
  ValueNotifier<bool> mapMarkersAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> mapMarkerTitleAnimationStarted = ValueNotifier(false);
  ValueNotifier<bool> iconMarkers = ValueNotifier(false);
  List<MapMarker> mapMarkersList = List.empty(growable: true);

  void onInit() {
    initializeMapMarkers();
    initializeMoreNavigationControls();
  }

  void onReady() {
    startControllerAnimation();
  }

  void startControllerAnimation() {
    controllerAnimationStarted.value = true;
  }

  void showMoreNavigationControls() {
    moreNavigationControllersMenuAnimationStarted.value = true;
  }

  void closeMoreNavigationControls() {
    moreNavigationControllersMenuAnimationStarted.value = false;
  }

  void startMapMarkersAnimation() {
    mapMarkersAnimationStarted.value = true;
  }

  void startMapMarkerTitleAnimation() {
    mapMarkerTitleAnimationStarted.value = true;
  }

  void closeMoreNavigationControlsAndShowIconMarkers() {
    closeMoreNavigationControls();
    showIconMarkers();
  }

  void showIconMarkers() {
    iconMarkers.value = !iconMarkers.value;
  }

  void initializeMapMarkers() {
    mapMarkersList = [
      MapMarker(
          title: "10,3 mn P", topPosition: 0.25.sh, leftPosition: 0.25.sw),
      MapMarker(title: "11 mn P", topPosition: 0.35.sh, leftPosition: 0.35.sw),
      MapMarker(
          title: "13,3 mn P", bottomPosition: 0.38.sh, leftPosition: 0.3.sw),
      MapMarker(title: "7,8 mn P", topPosition: 0.4.sh, rightPosition: 40.w),
      MapMarker(title: "8,5 mn P", topPosition: 0.5.sh, rightPosition: 40.w),
      MapMarker(
          title: "6,95 mn P", bottomPosition: 0.3.sh, rightPosition: 80.w),
    ];
  }

  void initializeMoreNavigationControls() {
    moreNavigationControlsList = [
      MoreNavigationControls(
          isSelected: false,
          name: "Casy areas",
          iconPath: injector<AppAssets>().casyAreasIcon),
      MoreNavigationControls(
          isSelected: true,
          name: "Price",
          iconPath: injector<AppAssets>().walletIconPng),
      MoreNavigationControls(
          isSelected: false,
          name: "Infrastructure",
          iconPath: injector<AppAssets>().infrastructureIcon),
      MoreNavigationControls(
          isSelected: false,
          name: "Without any layer",
          iconPath: injector<AppAssets>().layersIcon),
    ];
  }
}
