import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_up/sign_up_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/auth/local_auth_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@Injectable(as: SignUpRepository)
class SingUpRepositoryLocal implements SignUpRepository {
  SingUpRepositoryLocal({required LocalAuthService localAuthService})
      : _localAuthService = localAuthService;

  final LocalAuthService _localAuthService;

  @override
  Future<Result<bool>> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final result = await _localAuthService.createAccountRequest(
      userName: userName,
      email: email,
      password: password,
    );
    return result;
  }

  @override
  Future<Result<bool>> validateAccount({
    required String email,
    required String verificationCode,
    String? favoriteColor,
  }) async {
    final result = await _localAuthService.validateAccount(
      email: email,
      verificationCode: verificationCode,
      favoriteColor: favoriteColor,
    );

    return result;
  }
}
