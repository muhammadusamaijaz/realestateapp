import 'package:injectable/injectable.dart';
import 'package:moniepoint_flutter_assessment/src/config/styles/text_styles/app_text_styles.dart';
import 'package:moniepoint_flutter_assessment/src/config/theme/colors/app_colors.dart';
import 'package:moniepoint_flutter_assessment/src/core/assets/app_assets.dart';

@lazySingleton
class AppUIParams {
  final AppAssets appAssets;
  final AppColors appColors;
  final AppTextStyles appTextStyles;

  const AppUIParams(this.appAssets, this.appColors, this.appTextStyles);
}
