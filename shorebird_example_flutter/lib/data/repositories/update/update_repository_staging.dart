import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/update/update_repository.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@staging
@LazySingleton(as: UpdateRepository)
class UpdateRepositoryStaging extends UpdateRepository {
  UpdateRepositoryStaging({
    @ignoreParam ShorebirdUpdater? updater,
  }) : _updater = updater ?? ShorebirdUpdater();
  final ShorebirdUpdater _updater;

  final _currentTrack = UpdateTrack.staging;

  @override
  Future<Result<bool>> checkForUpdate() async {
    try {
      final status = await _updater.checkForUpdate(track: _currentTrack);

      return switch (status) {
        UpdateStatus.outdated ||
        UpdateStatus.restartRequired =>
          Result.ok(true),
        _ => Result.ok(false)
      };
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
  Future<Result<Patch?>> getCurrentPatch() async {
    try {
      final patch = await _updater.readCurrentPatch();
      return Result.ok(patch);
    } on Exception {
      return Result.error(Failure(message: 'Erro ao buscar patch atual'));
    }
  }

  // @override
  // Future<Result<bool>> get isOutdated async {
  //   final isOutdated = _status == UpdateStatus.outdated ||
  //       _status == UpdateStatus.restartRequired;
  //   return Result.ok(isOutdated);
  // }
}
