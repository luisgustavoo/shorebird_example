import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_in/sign_in_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SignInViewModel extends ChangeNotifier {
  SignInViewModel({required SignInRepository signInRepository})
      : _signInRepository = signInRepository {
    signIn = Command1(_signIn);
  }
  final SignInRepository _signInRepository;
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
        await _signInRepository.signIn(email: email, password: password);
    switch (result) {
      case Error<bool>():
        error = result.error;
        notifyListeners();
        break;
      default:
    }
    return result;
  }
}
