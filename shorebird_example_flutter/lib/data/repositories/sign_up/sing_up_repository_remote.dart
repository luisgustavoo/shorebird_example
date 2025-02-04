import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_up/sign_up_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/auth/auth_api_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@Injectable(as: SignUpRepository)
class SingUpRepositoryRemote implements SignUpRepository {
  SingUpRepositoryRemote({required AuthApiClient authApiClient})
      : _authApiClient = authApiClient;

  final AuthApiClient _authApiClient;

  @override
  Future<Result<bool>> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final result = await _authApiClient.createAccountRequest(
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
    final result = await _authApiClient.validateAccount(
      email: email,
      verificationCode: verificationCode,
      favoriteColor: favoriteColor,
    );

    return result;
  }
}
