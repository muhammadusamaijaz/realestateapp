import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/builders/consumers/consumer_with_state.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/base/base_widget.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/map_search/map_marker/map_screen_marker.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/map_search/navigation_controllers/map_screen_navigation_controllers.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/map_search/navigation_controllers/more_items/map_screen_more_navigation_items.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/map_search/search_controllers/map_screen_search_controllers.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/map_search/variants_controller/map_screen_variants_controller.dart';

class MapSearchScreen extends StatelessWidget {
  static const String name = "MAP_SEARCH_SCREEN";

  final AppUIParams appUIParams;

  const MapSearchScreen({super.key, required this.appUIParams});

  @override
  Widget build(BuildContext context) {
    return ConsumerWithState<MapSearchViewModel>(
      onInit: (viewModel) => viewModel.onInit(),
      onReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, _) => BaseWidget(
          useBaseWidgetPadding: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ///
              /// Background Map Image
              ///
              AssetImageLoader(
                imagePath: appUIParams.appAssets.googleMapImageJpg,
                fit: BoxFit.cover,
              ),

              ///
              /// Search Controllers
              ///
              Positioned(
                top: 40.h,
                left: 20.w,
                right: 20.w,
                child: const MapScreenSearchControllers(),
              ),

              ///
              /// Navigation Controllers
              ///
              Positioned(
                  bottom: 100.h,
                  left: 25.w,
                  child: const MapScreenNavigationControllers()),

              ///
              /// Variants Controllers
              ///
              Positioned(
                  bottom: 100.h,
                  right: 25.w,
                  child: const MapScreenVariantsController()),

              ///
              /// Map Markers
              ///
              for (int i = 0; i < viewModel.mapMarkersList.length; i++)
                Positioned(
                    top: viewModel.mapMarkersList[i].topPosition,
                    bottom: viewModel.mapMarkersList[i].bottomPosition,
                    left: viewModel.mapMarkersList[i].leftPosition,
                    right: viewModel.mapMarkersList[i].rightPosition,
                    child: MapScreenMarker(
                        mapMarker: viewModel.mapMarkersList[i])),

              ///
              /// More Navigation Controls
              ///
              Positioned(
                  bottom: 160.h,
                  left: 25.w,
                  child: const MapScreenMoreNavigationItems()),
            ],
          )),
    );
  }
}
