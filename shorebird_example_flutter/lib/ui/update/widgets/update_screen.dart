import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_example_flutter/ui/update/view_models/update_view_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    required this.updateViewModel,
    super.key,
  });
  final UpdateViewModel updateViewModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
    widget.updateViewModel.download.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant UpdateScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.updateViewModel.download.removeListener(_onResult);
    widget.updateViewModel.download.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.updateViewModel.download.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.updateViewModel.download.completed) {
      // Restart.restartApp(
      //   notificationTitle: 'Restarting App',
      //   notificationBody: 'Please tap here to open the app again.',
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Existe uma nova versão do aplicativo',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              ListenableBuilder(
                listenable: widget.updateViewModel.download,
                builder: (context, child) {
                  if (widget.updateViewModel.download.running) {
                    return const CircularProgressIndicator();
                  }

                  return child!;
                },
                child: ElevatedButton(
                  onPressed: widget.updateViewModel.download.execute,
                  child: const Text('Download'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
