import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SplashViewModel extends ChangeNotifier {
  SplashViewModel({
    required UpdateRepository updateRepository,
  }) : _updateRepository = updateRepository {
    checkForUpdate = Command0(_checkForUpdate)..execute();
  }
  final UpdateRepository _updateRepository;
  late final Command0<void> checkForUpdate;

  Future<Result<void>> _checkForUpdate() async {
    return _updateRepository.checkForUpdate();
  }
}
