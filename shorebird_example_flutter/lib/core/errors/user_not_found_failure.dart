import 'package:shorebird_example_flutter/core/errors/failure.dart';

class InvalidCredentialFailure implements Failure {
  InvalidCredentialFailure({
    this.message = 'Usuário ou senha inválidos',
  });
  @override
  final String? message;
}
