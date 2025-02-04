import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

abstract class UserRepository {
  Future<Result<User?>> getUser();
}
