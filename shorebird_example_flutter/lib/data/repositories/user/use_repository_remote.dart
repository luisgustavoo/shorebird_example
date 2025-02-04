import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/repositories/user/user_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/user/user_api_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@Injectable(as: UserRepository)
class UserRepositoryRemote implements UserRepository {
  UserRepositoryRemote({required UserApiClient userApiClient})
      : _userApiClient = userApiClient;
  final UserApiClient _userApiClient;

  @override
  Future<Result<User?>> getUser() async {
    final result = await _userApiClient.findUser();
    return result;
  }
}
