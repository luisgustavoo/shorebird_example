import 'package:shorebird_example_flutter/app/app.dart';
import 'package:shorebird_example_flutter/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
