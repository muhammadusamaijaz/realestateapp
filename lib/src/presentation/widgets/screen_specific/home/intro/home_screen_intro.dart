import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreenIntro extends StatelessWidget {
  const HomeScreenIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<bool>(
                valueListenable: viewModel.hiNameAnimationStarted,
                builder: (context, hiNameAnimationStarted, _) => AnimatedOpacity(
                      opacity: hiNameAnimationStarted ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      onEnd: () =>
                          viewModel.startRelevantAnimationsAfterLoadingHiName(),
                      child: Text(
                        "Hi, Marina",
                        style: injector<AppTextStyles>()
                            .semiBold18
                            .copyWith(color: "#B5A686".toColor),
                      ),
                    )),
            ValueListenableBuilder<bool>(
              valueListenable: viewModel.mainIntroTextAnimationStarted,
              builder: (context, mainIntroTextAnimationStarted, _) => Column(
                children: [
                  SizedBox(
                    height: 30.h,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          bottom: mainIntroTextAnimationStarted ? 0.h : -30.h,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            "let's select your",
                            style: injector<AppTextStyles>()
                                .semiBold24
                                .copyWith(color: "#000000".toColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          bottom: mainIntroTextAnimationStarted ? 0.h : -30.h,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            "perfect place",
                            style: injector<AppTextStyles>()
                                .semiBold24
                                .copyWith(color: "#000000".toColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
