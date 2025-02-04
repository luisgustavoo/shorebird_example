import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/auth/local_auth_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@LazySingleton(as: AuthRepository)
class AuthRepositoryLocal extends AuthRepository {
  AuthRepositoryLocal({required LocalAuthService localAuthService})
      : _localAuthService = localAuthService;

  final LocalAuthService _localAuthService;

  @override
  Future<bool> get isAuthenticated async {
    final result = await _localAuthService.isSignedIn();
    return switch (result) {
      Ok<bool>() => true,
      _ => false,
    };
  }

  @override
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result =
        await _localAuthService.signIn(email: email, password: password);

    return result;
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      return _localAuthService.signOut();
    } finally {
      notifyListeners();
    }
  }
}
