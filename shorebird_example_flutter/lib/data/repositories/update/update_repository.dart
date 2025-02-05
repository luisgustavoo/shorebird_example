import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

abstract class UpdateRepository {
  // Future<Result<bool>> get isOutdated;

  Future<Result<bool>> checkForUpdate();

  Future<Result<void>> download();

  Future<Result<Patch?>> getCurrentPatch();
}
