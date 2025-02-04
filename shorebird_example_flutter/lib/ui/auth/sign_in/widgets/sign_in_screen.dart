import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_in/view_models/sign_in_view_model.dart';
import 'package:shorebird_example_flutter/ui/core/themes/colors.dart';
import 'package:shorebird_example_flutter/ui/core/ui/custom_snack_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    required this.signInViewModel,
    super.key,
  });

  final SignInViewModel signInViewModel;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _updater = ShorebirdUpdater();
  final _currentTrack = UpdateTrack.stable;
  UpdateStatus status = UpdateStatus.unavailable;

  @override
  void initState() {
    super.initState();
    widget.signInViewModel.signIn.addListener(_onResult);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkForUpdate();
    });
  }

  @override
  void didUpdateWidget(covariant SignInScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.signInViewModel.signIn.removeListener(_onResult);
    widget.signInViewModel.signIn.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.signInViewModel.signIn.removeListener(_onResult);
    super.dispose();
  }

  Future<void> _checkForUpdate() async {
    try {
      status = await _updater.checkForUpdate(track: _currentTrack);
      if (!mounted) {
        return;
      }
      switch (status) {
        case UpdateStatus.upToDate:
        case UpdateStatus.outdated:
          await _updater.update(track: _currentTrack);
          setState(() {});
        case UpdateStatus.restartRequired:
        case UpdateStatus.unavailable:
      }
    } on UpdateException catch (error) {
      debugPrint('Error checking for update: ${error.message}');
    }
  }

  void _onResult() {
    if (widget.signInViewModel.signIn.completed) {
      widget.signInViewModel.signIn.clearResult();
      context.go(Routes.home);
    }

    if (widget.signInViewModel.signIn.error) {
      final error = widget.signInViewModel.error;
      widget.signInViewModel.signIn.clearResult();

      _scaffoldMessengerKey.currentState?.showSnackBar(
        CustomSnackBar(
          message: error?.message ?? '',
          actionClick: () {
            widget.signInViewModel.signIn.execute(
              (
                email: _emailController.value.text,
                password: _passwordController.value.text,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      UpdateStatus.outdated => _buildUpdateApp(),
      _ => _buildSignIn(),
    };
  }

  Widget _buildUpdateApp() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nova versão disponível',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Restart.restartApp(
                  notificationTitle: 'Restarting App',
                  notificationBody: 'Please tap here to open the app again.',
                );
              },
              child: const Text('Reiniciar App'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ListenableBuilder(
                  listenable: widget.signInViewModel.signIn,
                  builder: (context, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        await widget.signInViewModel.signIn.execute(
                          (
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      child: widget.signInViewModel.signIn.running
                          ? const Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.white1,
                                ),
                              ),
                            )
                          : const Text('Login'),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    context.push(Routes.signup);
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
