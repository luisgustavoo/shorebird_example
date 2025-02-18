import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SplashViewModel {
  SplashViewModel({
    required UpdateRepository updateRepository,
  }) : _updateRepository = updateRepository {
    checkForUpdate = Command0(_checkForUpdate)..execute();
  }
  final UpdateRepository _updateRepository;
  late final Command0<void> checkForUpdate;
  bool isOutdated = false;

  Future<Result<void>> _checkForUpdate() async {
    final result = await _updateRepository.checkForUpdate();

    switch (result) {
      case Ok<bool>():
        isOutdated = result.value ?? false;
        return Result.ok();
      case Error<bool>():
        isOutdated = false;
        return Result.error(result.error);
    }
  }
}
