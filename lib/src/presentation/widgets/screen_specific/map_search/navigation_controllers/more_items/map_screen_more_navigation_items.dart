import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class MapScreenMoreNavigationItems extends StatelessWidget {
  const MapScreenMoreNavigationItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MapSearchViewModel>(
        builder: (context, viewModel, _) => ValueListenableBuilder(
            valueListenable:
                viewModel.moreNavigationControllersMenuAnimationStarted,
            builder: (context, moreNavigationControllersMenuAnimationStarted,
                    _) =>
                GestureDetector(
                  onTap: () =>
                      viewModel.closeMoreNavigationControlsAndShowIconMarkers(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: EdgeInsets.all(
                        moreNavigationControllersMenuAnimationStarted
                            ? 10.h
                            : 0),
                    width: moreNavigationControllersMenuAnimationStarted
                        ? 150.w
                        : 0,
                    height: moreNavigationControllersMenuAnimationStarted
                        ? (viewModel.moreNavigationControlsList.length * 40.h)
                        : 0,
                    decoration: BoxDecoration(
                        color: "#FFFFFF".toColor,
                        borderRadius: BorderRadius.circular(
                            moreNavigationControllersMenuAnimationStarted
                                ? 20.r
                                : 5.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          viewModel.moreNavigationControlsList.length,
                          (index) => Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width:
                                        moreNavigationControllersMenuAnimationStarted
                                            ? 20.h
                                            : 0,
                                    height:
                                        moreNavigationControllersMenuAnimationStarted
                                            ? 20.h
                                            : 0,
                                    child: AssetImageLoader(
                                      imagePath: viewModel
                                          .moreNavigationControlsList[index]
                                          .iconPath,
                                      color: viewModel
                                              .moreNavigationControlsList[index]
                                              .isSelected
                                          ? "F9AF1C".toColor
                                          : Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                  AnimatedSize(
                                      duration: const Duration(milliseconds: 500),
                                      child: SizedBox(
                                          width:
                                              moreNavigationControllersMenuAnimationStarted
                                                  ? 10.w
                                                  : 0)),
                                  Expanded(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      child: AnimatedDefaultTextStyle(
                                          style: injector<AppTextStyles>()
                                              .semiBold12
                                              .copyWith(
                                                  fontSize:
                                                      moreNavigationControllersMenuAnimationStarted
                                                          ? 12
                                                          : 0,
                                                  color: viewModel
                                                          .moreNavigationControlsList[
                                                              index]
                                                          .isSelected
                                                      ? "F9AF1C".toColor
                                                      : Colors.grey
                                                          .withOpacity(0.5)),
                                          maxLines: 1,
                                          overflow: TextOverflow.fade,
                                          duration: const Duration(milliseconds: 500),
                                          child: Text(
                                              viewModel
                                                  .moreNavigationControlsList[
                                                      index]
                                                  .name,
                                              overflow: TextOverflow.fade)),
                                    ),
                                  ),
                                ],
                              )),
                    ),
                  ),
                )));
  }
}
