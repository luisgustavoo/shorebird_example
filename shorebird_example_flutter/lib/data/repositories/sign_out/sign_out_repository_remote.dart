import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_out/sign_out_repository.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

class SignOutRepositoryRemote implements SignOutRepository {
  @override
  Future<Result<void>> signOut() async {
    final loggedOut = await sessionManager.signOutDevice();
    return switch (loggedOut) {
      true => Result.ok(),
      _ => Result.error(Failure(message: 'Erro ao fazer logout')),
    };
  }
}
