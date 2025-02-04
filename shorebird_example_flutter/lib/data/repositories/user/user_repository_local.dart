import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/repositories/user/user_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/auth/local_auth_service.dart';
import 'package:shorebird_example_flutter/data/services/local/user/local_user_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@Injectable(as: UserRepository)
class UserRepositoryLocal extends UserRepository {
  UserRepositoryLocal({
    required LocalUserService localUserService,
    required LocalAuthService localAuthService,
  })  : _localUserService = localUserService,
        _localAuthService = localAuthService;
  final LocalUserService _localUserService;
  final LocalAuthService _localAuthService;

  @override
  Future<Result<User?>> getUser() async {
    return _localUserService.getUser();
  }

  @override
  Future<bool> get isAuthenticated async {
    final result = await _localAuthService.isSignedIn();
    return switch (result) {
      Ok<bool>() => true,
      _ => false,
    };
  }
}
