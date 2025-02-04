import 'package:flutter/material.dart';
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
  // @override
  // void initState() {
  //   super.initState();
  //   widget.splashViewModel.checkForUpdate.addListener(_onResult);
  // }

  // void _onResult() {
  //   if(){

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
    );
  }
}
