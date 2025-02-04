import 'package:shorebird_example_flutter/utils/result.dart';

abstract class SignUpRepository {
  Future<Result<bool>> signUp({
    required String userName,
    required String email,
    required String password,
  });
  Future<Result<bool>> validateAccount({
    required String email,
    required String verificationCode,
    String? favoriteColor,
  });
}
