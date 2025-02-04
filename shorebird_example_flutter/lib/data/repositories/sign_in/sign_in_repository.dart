import 'package:shorebird_example_flutter/utils/result.dart';

abstract class SignInRepository {
  Future<Result<bool>> signIn({
    required String email,
    required String password,
  });
}
