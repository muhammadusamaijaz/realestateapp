import 'package:injectable/injectable.dart';
import 'package:moniepoint_flutter_assessment/src/core/extensions/screen_util/screen_util_extension.dart';

@injectable
class AppUtils {
  /// --------------------------------------------------------------------------
  /// BASE WIDGET UTILS
  /// --------------------------------------------------------------------------
  double getBaseWidgetPadding() {
    return 20.w;
  }
}
