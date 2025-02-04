import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/core/ui/custom_snack_bar.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_validation_view_model.dart';

typedef SignUpDataValidationScreenParams = ({
  String email,
  String? favoriteColor,
});

class SignUpDataValidationScreen extends StatefulWidget {
  const SignUpDataValidationScreen({
    required this.signUpDataValidationViewModel,
    required this.email,
    required this.favoriteColor,
    super.key,
  });

  final SignUpDataValidationViewModel signUpDataValidationViewModel;
  final String email;
  final String? favoriteColor;

  @override
  State<SignUpDataValidationScreen> createState() =>
      _SignUpDataValidationScreenState();
}

class _SignUpDataValidationScreenState
    extends State<SignUpDataValidationScreen> {
  final _validationCodeController = TextEditingController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    widget.signUpDataValidationViewModel.validateAccount.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SignUpDataValidationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.signUpDataValidationViewModel.validateAccount
        .removeListener(_onResult);
    widget.signUpDataValidationViewModel.validateAccount.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.signUpDataValidationViewModel.validateAccount
        .removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.signUpDataValidationViewModel.validateAccount.completed) {
      widget.signUpDataValidationViewModel.validateAccount.clearResult();
      context.go(Routes.signin);
    }

    if (widget.signUpDataValidationViewModel.validateAccount.error) {
      widget.signUpDataValidationViewModel.validateAccount.clearResult();

      _scaffoldMessengerKey.currentState?.showSnackBar(
        CustomSnackBar(
          message: 'Erro ao validar cadastro',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _validationCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Código',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await widget.signUpDataValidationViewModel.validateAccount
                          .execute(
                        (
                          email: widget.email,
                          verificationCode: _validationCodeController.text,
                          favoriteColor: widget.favoriteColor,
                        ),
                      );
                    },
                    child: const Text('Verificar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
