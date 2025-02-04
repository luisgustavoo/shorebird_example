import 'package:shorebird_example_flutter/data/repositories/sign_out/sign_out_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/auth/local_auth_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

class SignOutRepositoryLocal implements SignOutRepository {
  SignOutRepositoryLocal({required LocalAuthService localAuthService})
      : _localAuthService = localAuthService;

  final LocalAuthService _localAuthService;

  @override
  Future<Result<void>> signOut() async {
    return _localAuthService.signOut();
  }
}
