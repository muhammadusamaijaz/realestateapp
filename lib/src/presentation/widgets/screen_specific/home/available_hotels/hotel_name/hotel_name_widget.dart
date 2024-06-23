import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/home/available_hotels/available_hotels.dart';
import 'package:provider/provider.dart';

class HotelNameWidget extends StatelessWidget {
  final AvailableHotels availableHotel;

  const HotelNameWidget({super.key, required this.availableHotel});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, _) => ValueListenableBuilder<bool>(
        valueListenable: viewModel.hotelNameAnimationStarted,
        builder: (context, hotelNameAnimationStarted, _) => Align(
          alignment: AlignmentDirectional.bottomStart,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 7.5.w),
                width: hotelNameAnimationStarted ? double.maxFinite : 60.w,
                height: 50.h,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(availableHotel.hotelName,
                          style: injector<AppTextStyles>()
                              .semiBold14
                              .copyWith(color: "#000000".toColor),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                          color: "#FFFFFF".toColor, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: "#B5A686".toColor,
                          size: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
