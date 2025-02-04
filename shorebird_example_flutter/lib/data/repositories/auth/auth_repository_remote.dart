import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/auth/auth_api_client.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@prod
@staging
@LazySingleton(as: AuthRepository)
class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({required AuthApiClient authApiClient})
      : _authApiClient = authApiClient;

  final AuthApiClient _authApiClient;
  @override
  Future<bool> get isAuthenticated async => sessionManager.isSignedIn;

  @override
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result =
        await _authApiClient.signIn(email: email, password: password);

    return result;
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final loggedOut = await sessionManager.signOutDevice();

      return switch (loggedOut) {
        true => Result.ok(),
        _ => Result.error(Failure(message: 'Erro ao fazer logout')),
      };
    } finally {
      notifyListeners();
    }
  }
}
