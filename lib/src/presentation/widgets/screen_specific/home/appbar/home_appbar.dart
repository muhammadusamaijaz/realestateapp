import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: viewModel.locationBoxAnimationStarted,
              builder: (context, locationBoxAnimationStarted, _) =>
                  AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                padding: EdgeInsetsDirectional.only(start: 20.w),
                width: locationBoxAnimationStarted ? 0.55.sw : 0.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: "#FFFFFF".toColor,
                    borderRadius: BorderRadius.circular(10.r)),
                onEnd: () => viewModel.startLocationBoxChildTextAnimation(),
                child: ValueListenableBuilder<bool>(
                  valueListenable: viewModel.locationBoxChildTextAnimationStarted,
                  builder: (context, locationBoxChildTextAnimationStarted, _) =>
                      AnimatedOpacity(
                    opacity: locationBoxChildTextAnimationStarted ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    onEnd: () => viewModel.startHiNameTextAnimation(),
                    child: Row(
                      children: [
                        AssetImageLoader(
                          imagePath: injector<AppAssets>().locationIconPng,
                          width: 18,
                          height: 18,
                          color: "#B5A686".toColor,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "Saint Petersburg",
                          style: injector<AppTextStyles>()
                              .regular14
                              .copyWith(color: "#B5A686".toColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: viewModel.appBarProfileAvatarAnimationStarted,
                builder: (context, appBarProfileAvatarAnimationStarted, _) =>
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1500),
                          width: appBarProfileAvatarAnimationStarted ? 50.w : 0,
                          height: appBarProfileAvatarAnimationStarted ? 50.h : 0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.centerStart,
                                  end: AlignmentDirectional.centerEnd,
                                  colors: [
                                    "#DE6F0F".toColor,
                                    "#EAAA3B".toColor
                                  ])),
                          child: ClipOval(
                            child: AssetImageLoader(
                              imagePath: injector<AppAssets>().profilePicturePng,
                              width: 30.w,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
