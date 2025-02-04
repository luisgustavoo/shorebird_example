import 'package:shorebird_example_flutter/utils/result.dart';

abstract class SignOutRepository {
  Future<Result<void>> signOut();
}
