import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/splash/view_models/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    required this.splashViewModel,
    super.key,
  });

  final SplashViewModel splashViewModel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.splashViewModel.checkForUpdate.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.splashViewModel.checkForUpdate.removeListener(_onResult);
    widget.splashViewModel.checkForUpdate.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.splashViewModel.checkForUpdate.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (!widget.splashViewModel.checkForUpdate.running) {
      if (widget.splashViewModel.isOutdated) {
        context.go(Routes.update);
      } else {
        context.go(Routes.signin);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.splashViewModel.checkForUpdate,
        builder: (context, child) {
          if (widget.splashViewModel.checkForUpdate.running) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return child!;
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
