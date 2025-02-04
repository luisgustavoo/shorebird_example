import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/config/app_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  // generateForDir: ['test'],
)
void configureDependencies() => getIt.init();

// @module
// abstract class ClientGatewayUrlModule {
//   @Named('baseUrl')
//   String get baseUrl => const String.fromEnvironment('baseUrl');

//   @Named('baseUrlTest')
//   String get baseUrlTest => 'http://192.168.0.179:9090/';
// }
