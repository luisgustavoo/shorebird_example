import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/routers/router.dart';
import 'package:shorebird_example_flutter/ui/core/themes/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Shorebird Demo',
      theme: AppTheme.darkTheme,
      // theme: ThemeData.from(
      //   // useMaterial3: false,
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch: Colors.orange,
      //   ),
      // ),
      darkTheme: AppTheme.darkTheme,
    );
  }
}
