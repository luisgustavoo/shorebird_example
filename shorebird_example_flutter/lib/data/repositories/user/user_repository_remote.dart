import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/data/repositories/user/user_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/data/services/api/user/user_api_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@prod
@staging
@Injectable(as: UserRepository)
class UserRepositoryRemote extends UserRepository {
  UserRepositoryRemote({required UserApiClient userApiClient})
      : _userApiClient = userApiClient;
  final UserApiClient _userApiClient;

  @override
  Future<Result<User?>> getUser() async {
    final result = await _userApiClient.findUser();
    return result;
  }

  @override
  Future<bool> get isAuthenticated async => sessionManager.isSignedIn;
}
