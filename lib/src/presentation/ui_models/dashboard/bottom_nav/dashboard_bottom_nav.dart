import 'package:flutter/cupertino.dart';

class DashboardBottomNav {
  final String navItemName;
  final String iconPath;
  final ValueNotifier<bool> isSelected;

  const DashboardBottomNav(
      {required this.navItemName,
      required this.iconPath,
      required this.isSelected});
}
