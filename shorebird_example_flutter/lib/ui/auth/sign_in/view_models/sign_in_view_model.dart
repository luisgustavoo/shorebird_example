import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SignInViewModel extends ChangeNotifier {
  SignInViewModel({
    required AuthRepository authRepository,
    required UpdateRepository updateRepository,
  })  : _authRepository = authRepository,
        _updateRepository = updateRepository {
    signIn = Command1(_signIn);
    getCurrentPatch = Command0(_getCurrentPatch)..execute();
  }
  final AuthRepository _authRepository;
  final UpdateRepository _updateRepository;
  Patch? patch;
  Failure? error;

  late final Command1<
      bool,
      ({
        String email,
        String password,
      })> signIn;

  late final Command0<void> getCurrentPatch;

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
    }

    return result;
  }

  Future<Result<void>> _getCurrentPatch() async {
    final result = await _updateRepository.getCurrentPatch();
    switch (result) {
      case Ok<Patch?>():
        patch = result.value;
        notifyListeners();
        return Result.ok();
      case Error<Patch?>():
        notifyListeners();
        return Result.error(Failure(message: 'Erro ao buscar patch atual'));
    }
  }
}
