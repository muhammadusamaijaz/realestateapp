import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class MapScreenSearchControllers extends StatelessWidget {
  const MapScreenSearchControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MapSearchViewModel>(
      builder: (context, viewModel, _) => ValueListenableBuilder(
          valueListenable: viewModel.controllerAnimationStarted,
          builder: (context, controllerAnimationStarted, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    width: controllerAnimationStarted ? 0.7.sw : 0,
                    height: controllerAnimationStarted ? 40.h : 0,
                    decoration: BoxDecoration(
                        color: "#FFFFFF".toColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: controllerAnimationStarted ? 18.w : 0,
                            height: controllerAnimationStarted ? 18.w : 0,
                            child: AssetImageLoader(
                                imagePath: injector<AppUIParams>()
                                    .appAssets
                                    .searchMapPng),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 6,
                          child: AnimatedDefaultTextStyle(
                              style: injector<AppTextStyles>()
                                  .semiBold14
                                  .copyWith(
                                      fontSize:
                                          controllerAnimationStarted ? 14 : 0,
                                      color: Colors.black),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              duration: const Duration(seconds: 1),
                              child: const Text(
                                "Saint Petersburg",
                                overflow: TextOverflow.fade,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: controllerAnimationStarted ? 40.h : 0,
                    height: controllerAnimationStarted ? 40.h : 0,
                    decoration: BoxDecoration(
                        color: "#FFFFFF".toColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Center(
                      child: AssetImageLoader(
                          width: 18.h,
                          height: 18.h,
                          imagePath:
                              injector<AppUIParams>().appAssets.filterPng),
                    ),
                  ),
                ],
              )),
    );
  }
}
