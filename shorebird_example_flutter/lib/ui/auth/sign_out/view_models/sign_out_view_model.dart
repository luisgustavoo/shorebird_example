import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SignOutViewModel extends ChangeNotifier {
  SignOutViewModel({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository {
    signOut = Command0(_signOut);
  }

  final AuthRepository _authRepository;
  Failure? error;

  late final Command0<void> signOut;

  Future<Result<void>> _signOut() async {
    final result = await _authRepository.signOut();
    if (result is Error<void>) {
      error = result.error;
      notifyListeners();
    }

    return result;
  }
}
