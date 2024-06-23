import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/builders/consumers/consumer_with_state.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/base/base_widget.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/home/appbar/home_appbar.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/home/available_hotels/home_screen_available_hotels.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/home/intro/home_screen_intro.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/screen_specific/home/stats/home_screen_stats.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "HOME_SCREEN";

  final AppUIParams appUIParams;

  const HomeScreen({super.key, required this.appUIParams});

  @override
  Widget build(BuildContext context) {
    return ConsumerWithState<HomeViewModel>(
      onReady: (viewModel) => viewModel.onReady(),
      builder: (context, viewModel, _) => BaseWidget(
          useBaseWidgetPadding: false,
          child: Column(
            children: [
              SizedBox(height: 40.h),
              const HomeAppBar(),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView(
                  children: [
                    const HomeScreenIntro(),
                    SizedBox(height: 30.h),
                    const HomeScreenStats(),
                    const HomeScreenAvailableHotels()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
