import 'package:shorebird_example_flutter/app/app.dart';
import 'package:shorebird_example_flutter/bootstrap.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/routers/app_router.dart';

Future<void> main() async {
  await bootstrap(
    () => App(
      router: getIt<AppRouter>(),
    ),
  );
}
