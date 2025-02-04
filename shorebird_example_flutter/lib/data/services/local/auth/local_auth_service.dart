import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/services/shared_preferences_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@injectable
class LocalAuthService {
  LocalAuthService({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  Future<Result<bool>> createAccountRequest({
    required String userName,
    required String email,
    required String password,
  }) async {
    return Result.ok(true);
  }

  Future<Result<bool>> validateAccount({
    required String email,
    required String verificationCode,
    String? favoriteColor,
  }) async {
    await _sharedPreferencesService.clear();
    await _sharedPreferencesService.saveUser(
      User(
        id: 1,
        favoriteColor: favoriteColor,
        userInfoId: 1,
        // userInfo: UserInfo(),
      ),
    );
    return Result.ok(true);
  }

  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _sharedPreferencesService.getUser();
    return switch (result) {
      Ok<User?>() => Result.ok(true),
      _ => Result.error(Failure(message: 'Não foi possível fazer login')),
    };
  }

  Future<Result<bool>> isSignedIn() async {
    final result = await _sharedPreferencesService.getUser();
    return switch (result) {
      Ok<User?>() => Result.ok(true),
      _ => Result.error(Failure(message: 'Usuário não logado')),
    };
  }

  Future<Result<void>> signOut() async {
    return _sharedPreferencesService.clear();
  }
}
