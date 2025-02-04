import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';

import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SignInViewModel extends ChangeNotifier {
  SignInViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    signIn = Command1(_signIn);
  }
  final AuthRepository _authRepository;
  Failure? error;

  late final Command1<
      bool,
      ({
        String email,
        String password,
      })> signIn;

  Future<Result<bool>> _signIn(
    ({
      String email,
      String password,
    }) credentials,
  ) async {
    final (email: email, password: password) = credentials;
    final result =
        await _authRepository.signIn(email: email, password: password);

    if (result is Error<bool>) {
      error = result.error;
      notifyListeners();
    }

    return result;
  }
}
