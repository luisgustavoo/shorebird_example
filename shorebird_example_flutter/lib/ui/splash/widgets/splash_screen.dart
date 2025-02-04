import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/ui/splash/view_models/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    required this.splashViewModel,
    super.key,
  });

  final SplashViewModel splashViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
