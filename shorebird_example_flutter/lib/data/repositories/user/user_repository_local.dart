import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/repositories/user/user_repository.dart';
import 'package:shorebird_example_flutter/data/services/local/user/local_user_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@Injectable(as: UserRepository)
class UserRepositoryLocal implements UserRepository {
  UserRepositoryLocal({required LocalUserService localUserService})
      : _localUserService = localUserService;
  final LocalUserService _localUserService;

  @override
  Future<Result<User?>> getUser() async {
    return _localUserService.getUser();
  }
}
