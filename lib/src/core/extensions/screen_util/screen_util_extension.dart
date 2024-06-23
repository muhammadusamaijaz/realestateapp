import '../../../injector/injector.dart';
import '../../utils/screen_util/screen_util.dart';

///
/// Base extension for exposing endpoints for responsive height, width and
/// radius etc.
///
extension ScreenUtilExtension on num {
  double get h => injector<ScreenUtil>().setHeight(this);

  double get w => injector<ScreenUtil>().setWidth(this);

  double get r => injector<ScreenUtil>().radius(this);

  double get sh => injector<ScreenUtil>().height * this;

  double get sw => injector<ScreenUtil>().width * this;
}
