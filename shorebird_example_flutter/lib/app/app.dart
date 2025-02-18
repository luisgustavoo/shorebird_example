import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/routers/app_router.dart';
import 'package:shorebird_example_flutter/ui/core/themes/theme.dart';

class App extends StatefulWidget {
  const App({
    required this.appRouter,
    super.key,
  });

  final AppRouter appRouter;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.appRouter.router,
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
