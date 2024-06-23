import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreenStats extends StatelessWidget {
  const HomeScreenStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, viewModel, _) => ValueListenableBuilder(
              valueListenable: viewModel.statsAnimationStarted,
              builder: (context, statsAnimationStarted, _) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0.42.sw,
                      height: 0.42.sw,
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: statsAnimationStarted ? 0.42.sw : 0,
                          height: statsAnimationStarted ? 0.42.sw : 0,
                          decoration: BoxDecoration(
                              color: "#F9AF1C".toColor, shape: BoxShape.circle),
                          onEnd: () => viewModel.startAvailableHotelsAnimation(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedSize(
                                duration: const Duration(seconds: 1),
                                child: SizedBox(
                                    height: statsAnimationStarted ? 15.h : 0),
                              ),
                              AnimatedDefaultTextStyle(
                                  style: injector<AppTextStyles>()
                                      .semiBold14
                                      .copyWith(
                                          fontSize:
                                              statsAnimationStarted ? 14 : 0),
                                  duration: const Duration(milliseconds: 1000),
                                  child: const Text("BUY",
                                      overflow: TextOverflow.fade)),
                              ValueListenableBuilder<int>(
                                valueListenable: viewModel.buyStatsValue,
                                builder: (context, buyStatsValue, _) =>
                                    AnimatedDefaultTextStyle(
                                        style: injector<AppTextStyles>()
                                            .bold24
                                            .copyWith(
                                                fontSize: statsAnimationStarted
                                                    ? 24
                                                    : 0),
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        child: Text("$buyStatsValue",
                                            overflow: TextOverflow.fade)),
                              ),
                              AnimatedDefaultTextStyle(
                                  style: injector<AppTextStyles>()
                                      .semiBold14
                                      .copyWith(
                                          fontSize:
                                              statsAnimationStarted ? 14 : 0),
                                  duration: const Duration(milliseconds: 1000),
                                  child: const Text("offers",
                                      overflow: TextOverflow.fade)),
                              AnimatedSize(
                                duration: const Duration(seconds: 1),
                                child: SizedBox(
                                    height: statsAnimationStarted ? 15.h : 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.42.sw,
                      height: 0.42.sw,
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: statsAnimationStarted ? 0.42.sw : 0,
                          height: statsAnimationStarted ? 0.42.sw : 0,
                          decoration: BoxDecoration(
                              color: "#FFFFFF".toColor,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedSize(
                                duration: const Duration(seconds: 1),
                                child: SizedBox(
                                    height: statsAnimationStarted ? 15.h : 0),
                              ),
                              AnimatedDefaultTextStyle(
                                  style: injector<AppTextStyles>()
                                      .semiBold14
                                      .copyWith(
                                          fontSize:
                                              statsAnimationStarted ? 14 : 0,
                                          color: "#B5A686".toColor),
                                  duration: const Duration(milliseconds: 1000),
                                  child: const Text("RENT",
                                      overflow: TextOverflow.fade)),
                              ValueListenableBuilder<int>(
                                valueListenable: viewModel.buyStatsValue,
                                builder: (context, buyStatsValue, _) =>
                                    AnimatedDefaultTextStyle(
                                        style: injector<AppTextStyles>()
                                            .bold24
                                            .copyWith(
                                                fontSize: statsAnimationStarted
                                                    ? 24
                                                    : 0,
                                                color: "#B5A686".toColor),
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        child: Text("$buyStatsValue",
                                            overflow: TextOverflow.fade)),
                              ),
                              AnimatedDefaultTextStyle(
                                  style: injector<AppTextStyles>()
                                      .semiBold14
                                      .copyWith(
                                          fontSize:
                                              statsAnimationStarted ? 14 : 0,
                                          color: "#B5A686".toColor),
                                  duration: const Duration(milliseconds: 1000),
                                  child: const Text("offers",
                                      overflow: TextOverflow.fade)),
                              AnimatedSize(
                                duration: const Duration(seconds: 1),
                                child: SizedBox(
                                    height: statsAnimationStarted ? 15.h : 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
