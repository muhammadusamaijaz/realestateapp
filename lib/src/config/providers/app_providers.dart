import 'package:injectable/injectable.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/dashboard_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/dashboard/home/home_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/map_search/map_search_viewmodel.dart';
import 'package:moniepoint_flutter_assessment/src/presentation/screens/splash/splash_viewmodel.dart';
import 'package:provider/provider.dart';

@singleton
class AppProviders {
  final List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<SplashViewModel>(create: (_) => SplashViewModel()),
    ChangeNotifierProvider<DashboardViewModel>(
        create: (_) => DashboardViewModel()),
    ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
    ChangeNotifierProvider<MapSearchViewModel>(
        create: (_) => MapSearchViewModel()),
  ];
}
