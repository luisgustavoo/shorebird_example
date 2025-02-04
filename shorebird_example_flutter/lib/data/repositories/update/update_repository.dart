import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

abstract class UpdateRepository extends ChangeNotifier {
  Future<Result<bool>> get isOutdated;

  Future<Result<void>> checkForUpdate();

  Future<Result<void>> download();
}
