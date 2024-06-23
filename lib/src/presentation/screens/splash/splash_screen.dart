import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_assessment/src/core/builders/consumers/consumer_with_state.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/string/string_to_color_extension.dart';
import 'package:moniepoint_flutter_assessment/src/core/params/app_ui/app_ui_params.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/splash/splash_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/widgets/base/base_widget.dart';

class SplashScreen extends StatelessWidget {
  static const String name = "SPLASH_SCREEN";

  final AppUIParams appUIParams;

  const SplashScreen({super.key, required this.appUIParams});

  @override
  Widget build(BuildContext context) {
    return ConsumerWithState<SplashViewModel>(
      onInit: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, _) => BaseWidget(
          child: Center(
        child: Text(
          "MONIEPOINT FLUTTER ASSESSMENT",
          textAlign: TextAlign.center,
          style: appUIParams.appTextStyles.bold24
              .copyWith(color: "#000000".toColor),
        ),
      )),
    );
  }
}
