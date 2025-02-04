import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_in/sign_in_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/auth/local_auth_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@Injectable(as: SignInRepository)
class SignInRepositoryLocal implements SignInRepository {
  SignInRepositoryLocal({required LocalAuthService localAuthService})
      : _localAuthService = localAuthService;

  final LocalAuthService _localAuthService;

  @override
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    final result =
        await _localAuthService.signIn(email: email, password: password);

    return result;
  }
}
