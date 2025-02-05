import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@prod
@staging
@injectable
class UserApiClient {
  final _log = Logger('UserApiClient');

  Future<Result<User?>> findUser() async {
    try {
      final user = await client.user.getUser();
      return Result.ok(user);
    } on ServerException catch (e, s) {
      _log.severe('Erro ao buscar dados do usuário', e, s);
      return Result.error(Failure(message: e.message));
    } on ServerpodClientException catch (e, s) {
      _log.severe('Erro ao buscar dados do usuário', e, s);
      return Result.error(Failure(message: e.message));
    }
  }
}
