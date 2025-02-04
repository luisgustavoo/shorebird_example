import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<Result<bool>> signIn({
    required String email,
    required String password,
  });

  Future<Result<void>> signOut();
}
