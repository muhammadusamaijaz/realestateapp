import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class MapScreenNavigationControllers extends StatelessWidget {
  const MapScreenNavigationControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MapSearchViewModel>(
        builder: (context, viewModel, _) => ValueListenableBuilder<bool>(
              valueListenable: viewModel.controllerAnimationStarted,
              builder: (context, controllerAnimationStarted, _) => Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: controllerAnimationStarted ? 50.w : 0,
                    height: controllerAnimationStarted ? 50.h : 0,
                    decoration: BoxDecoration(
                        color: "#FFFFFF".toColor.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: Center(
                      child: AssetImageLoader(
                          width: 18.h,
                          height: 18.h,
                          color: "#FFFFFF".toColor,
                          imagePath:
                              injector<AppUIParams>().appAssets.walletIconPng),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () => viewModel.showMoreNavigationControls(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: controllerAnimationStarted ? 50.w : 0,
                      height: controllerAnimationStarted ? 50.h : 0,
                      decoration: BoxDecoration(
                          color: "#FFFFFF".toColor.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: Center(
                        child: AssetImageLoader(
                            width: 18.h,
                            height: 18.h,
                            color: "#FFFFFF".toColor,
                            imagePath: injector<AppUIParams>()
                                .appAssets
                                .navigationArrowIcon),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
