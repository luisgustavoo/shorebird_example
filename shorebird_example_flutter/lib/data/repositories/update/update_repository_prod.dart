import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@prod
@LazySingleton(as: UpdateRepository)
class UpdateRepositoryProd extends UpdateRepository {
  UpdateRepositoryProd({
    @ignoreParam ShorebirdUpdater? updater,
  }) : _updater = updater ?? ShorebirdUpdater();
  final ShorebirdUpdater _updater;

  final _currentTrack = UpdateTrack.stable;
  UpdateStatus _status = UpdateStatus.unavailable;

  @override
  Future<Result<void>> checkForUpdate() async {
    try {
      _status = await _updater.checkForUpdate(track: _currentTrack);
      notifyListeners();
      return Result.ok();
    } on UpdateException catch (e, s) {
      log('Error checking for update: ${e.message}', error: e, stackTrace: s);
      return Result.error(Failure(message: e.message));
    }
  }

  @override
  Future<Result<void>> download() async {
    try {
      await _updater.update(track: _currentTrack);
      return Result.ok();
    } on Exception {
      return Result.error(
        Failure(
          message: 'Não possível fazer download da nova versão',
        ),
      );
    }
  }

  @override
  Future<Result<bool>> get isOutdated async {
    final isOutdated = _status == UpdateStatus.outdated ||
        _status == UpdateStatus.restartRequired;
    return Result.ok(isOutdated);
  }
}
