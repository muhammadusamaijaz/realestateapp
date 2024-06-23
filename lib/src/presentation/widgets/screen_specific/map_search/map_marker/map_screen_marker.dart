import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/map_search/markers/map_marker.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class MapScreenMarker extends StatelessWidget {
  final MapMarker mapMarker;

  const MapScreenMarker({super.key, required this.mapMarker});

  @override
  Widget build(BuildContext context) {
    return Consumer<MapSearchViewModel>(
        builder: (context, viewModel, _) => SizedBox(
              width: 80.w,
              height: 40.h,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: ValueListenableBuilder<bool>(
                  valueListenable: viewModel.iconMarkers,
                  builder: (context, iconMarkers, _) => ValueListenableBuilder<
                          bool>(
                      valueListenable: viewModel.mapMarkersAnimationStarted,
                      builder: (context, mapMarkersAnimationStarted, _) =>
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: mapMarkersAnimationStarted ? 40.h : 0,
                            width: mapMarkersAnimationStarted
                                ? (iconMarkers ? 40.w : 80.w)
                                : 0,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            onEnd: () =>
                                viewModel.startMapMarkerTitleAnimation(),
                            decoration: BoxDecoration(
                                color: "#F9AF1C".toColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r))),
                            child: ValueListenableBuilder<bool>(
                              valueListenable:
                                  viewModel.mapMarkerTitleAnimationStarted,
                              builder: (context, mapMarkerTitleAnimationStarted,
                                      _) =>
                                  AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity: mapMarkerTitleAnimationStarted
                                          ? 1
                                          : 0,
                                      child: Center(
                                          child: iconMarkers
                                              ? AssetImageLoader(
                                                  width: 24.w,
                                                  height: 24.h,
                                                  color: "#FFFFFF".toColor,
                                                  imagePath:
                                                      injector<AppAssets>()
                                                          .buildingIconPng)
                                              : Text(
                                                  mapMarker.title,
                                                  style:
                                                      injector<AppTextStyles>()
                                                          .regular14
                                                          .copyWith(
                                                              color: "#FFFFFF"
                                                                  .toColor),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                ))),
                            ),
                          )),
                ),
              ),
            ));
  }
}
