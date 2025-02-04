import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/config/dependencies.config.dart';

const staging = Environment('staging');

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() =>
    getIt.init(environment: const String.fromEnvironment('environment'));
