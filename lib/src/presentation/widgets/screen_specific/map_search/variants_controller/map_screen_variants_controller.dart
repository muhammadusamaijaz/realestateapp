import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class MapScreenVariantsController extends StatelessWidget {
  const MapScreenVariantsController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MapSearchViewModel>(
        builder: (context, viewModel, _) => ValueListenableBuilder(
            valueListenable: viewModel.controllerAnimationStarted,
            builder: (context, controllerAnimationStarted, _) =>
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.symmetric(
                      horizontal: controllerAnimationStarted ? 15.w : 0),
                  width: controllerAnimationStarted ? 0.45.sw : 0,
                  height: controllerAnimationStarted ? 50.h : 0,
                  onEnd: () => viewModel.startMapMarkersAnimation(),
                  decoration: BoxDecoration(
                      color: "#FFFFFF".toColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: controllerAnimationStarted ? 18.w : 0,
                        height: controllerAnimationStarted ? 18.w : 0,
                        child: AssetImageLoader(
                            imagePath:
                                injector<AppUIParams>().appAssets.listIconPng,
                            color: "#FFFFFF".toColor),
                      ),
                      AnimatedSize(
                          duration: const Duration(milliseconds: 500),
                          child: SizedBox(
                              width: controllerAnimationStarted ? 10.w : 0)),
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedDefaultTextStyle(
                              style: injector<AppTextStyles>()
                                  .semiBold14
                                  .copyWith(
                                      fontSize:
                                          controllerAnimationStarted ? 14 : 0,
                                      color: "#FFFFFF".toColor),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              duration: const Duration(milliseconds: 500),
                              child: const Text("List of variants",
                                  overflow: TextOverflow.fade)),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
