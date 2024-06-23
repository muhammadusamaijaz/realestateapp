// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/providers/app_providers.dart' as _i6;
import '../config/styles/text_styles/app_text_styles.dart' as _i8;
import '../config/theme/colors/app_colors.dart' as _i9;
import '../core/assets/app_assets.dart' as _i7;
import '../core/constants/app_constants.dart' as _i3;
import '../core/params/app_ui/app_ui_params.dart' as _i10;
import '../core/utils/app_utils/app_utils.dart' as _i4;
import '../core/utils/screen_util/screen_util.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppConstants>(() => _i3.AppConstants());
    gh.factory<_i4.AppUtils>(() => _i4.AppUtils());
    gh.singleton<_i5.ScreenUtil>(() => _i5.ScreenUtil());
    gh.singleton<_i6.AppProviders>(() => _i6.AppProviders());
    gh.lazySingleton<_i7.AppAssets>(() => _i7.AppAssets());
    gh.lazySingleton<_i8.AppTextStyles>(() => _i8.AppTextStyles());
    gh.lazySingleton<_i9.AppColors>(() => _i9.AppColors());
    gh.lazySingleton<_i10.AppUIParams>(() => _i10.AppUIParams(
          gh<_i7.AppAssets>(),
          gh<_i9.AppColors>(),
          gh<_i8.AppTextStyles>(),
        ));
    return this;
  }
}
