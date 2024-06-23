import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moniepoint_flutter_assessment/src/injector/injector.config.dart';

final injector = GetIt.I;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
Future<void> configureDependencies() async => await injector.init();
