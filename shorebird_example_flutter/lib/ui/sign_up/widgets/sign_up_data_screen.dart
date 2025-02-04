import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/core/themes/colors.dart';
import 'package:shorebird_example_flutter/ui/core/ui/custom_snack_bar.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_view_model.dart';

class SignUpDataScreen extends StatefulWidget {
  const SignUpDataScreen({
    required this.signUpDataViewModel,
    super.key,
  });

  final SignUpDataViewModel signUpDataViewModel;

  @override
  State<SignUpDataScreen> createState() => _SignUpDataScreenState();
}

class _SignUpDataScreenState extends State<SignUpDataScreen> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _favoriteColorController = TextEditingController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.signUpDataViewModel.signUp.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SignUpDataScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.signUpDataViewModel.signUp.removeListener(_onResult);
    widget.signUpDataViewModel.signUp.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.signUpDataViewModel.signUp.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.signUpDataViewModel.signUp.completed) {
      widget.signUpDataViewModel.signUp.clearResult();
      context.push(
        Routes.signupValidation,
        extra: (
          email: _emailController.text,
          favoriteColor: _favoriteColorController.text,
        ),
      );
    }

    if (widget.signUpDataViewModel.signUp.error) {
      widget.signUpDataViewModel.signUp.clearResult();

      _scaffoldMessengerKey.currentState?.showSnackBar(
        CustomSnackBar(
          message: 'Erro ao cadastrar dados',
          actionClick: () {
            widget.signUpDataViewModel.signUp.execute(
              (
                email: _emailController.value.text,
                password: _passwordController.value.text,
                userName: _userNameController.text,
                favoriteColor: _favoriteColorController.text,
              ),
            );
          },
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome do usuário',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Informe o Nome do usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Informe o Email';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Informe a Senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _favoriteColorController,
                      decoration: const InputDecoration(
                        labelText: 'Cor Favorita',
                        helper: Text(
                          '(opcional)',
                          style: TextStyle(
                            color: AppColors.grey3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ListenableBuilder(
                      listenable: widget.signUpDataViewModel.signUp,
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            final valid =
                                _formKey.currentState?.validate() ?? false;
                            if (valid) {
                              await widget.signUpDataViewModel.signUp.execute(
                                (
                                  userName: _userNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  favoriteColor: _favoriteColorController.text,
                                ),
                              );
                            }
                          },
                          child: widget.signUpDataViewModel.signUp.running
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.white1,
                                  ),
                                )
                              : const Text('Cadastrar'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
