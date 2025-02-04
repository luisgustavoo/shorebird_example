import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_in/sign_in_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/auth/auth_api_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@prod
@staging
@Injectable(as: SignInRepository)
class SignInRepositoryRemote implements SignInRepository {
  SignInRepositoryRemote({required AuthApiClient authApiClient})
      : _authApiClient = authApiClient;

  final AuthApiClient _authApiClient;

  @override
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result =
        await _authApiClient.signIn(email: email, password: password);

    return result;
  }
}
