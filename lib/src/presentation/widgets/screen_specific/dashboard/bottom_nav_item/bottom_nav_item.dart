import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/ui_models/dashboard/bottom_nav/dashboard_bottom_nav.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/images/asset_image/asset_image_loader.dart';

class BottomNavItem extends StatelessWidget {
  final DashboardBottomNav bottomNav;

  const BottomNavItem({super.key, required this.bottomNav});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: bottomNav.isSelected,
      builder: (context, isSelected, _) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: isSelected ? 60 : 40,
        height: isSelected ? 60 : 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: isSelected ? "#F9AF1C".toColor : "#1D1C23".toColor),
        child: Center(
          child: AssetImageLoader(
              imagePath: bottomNav.iconPath,
              width: 24.w,
              height: 24.h,
              color: Colors.white),
        ),
      ),
    );
  }
}
