import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@injectable
class AuthApiClient {
  final _log = Logger('AuthApiClient');

  Future<Result<bool>> createAccountRequest({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final created = await emailAuthController.createAccountRequest(
        userName,
        email,
        password,
      );
      if (!created) {
        return Result.error(
          Failure(
            message: 'Não foi possível criar o usuário',
          ),
        );
      }
      return Result.ok(created);
    } on ServerException catch (e, s) {
      _log.severe('Erro ao cadastrar usuário', e, s);
      return Result.error(Failure(message: e.message));
    }
  }

  Future<Result<bool>> validateAccount({
    required String email,
    required String verificationCode,
    String? favoriteColor,
  }) async {
    try {
      final userInfo =
          await emailAuthController.validateAccount(email, verificationCode);
      if (userInfo != null) {
        await client.auth.createUser(
          User(
            userInfoId: userInfo.id!,
            userInfo: userInfo,
            favoriteColor: favoriteColor,
          ),
        );
      }
      return switch (userInfo) {
        != null => Result.ok(true),
        _ => Result.error(Failure(message: 'Erro ao validar email do usuário')),
      };
    } on ServerException catch (e, s) {
      _log.severe('Erro ao validar email do usuário', e, s);
      return Result.error(Failure(message: e.message));
    }
  }

  Future<Result<bool>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userInfo = await emailAuthController.signIn(email, password);

      return switch (userInfo) {
        != null => Result.ok(true),
        _ => Result.ok(false),
      };
    } on ServerException catch (e, s) {
      _log.severe('Erro ao realizar login', e, s);
      return Result.error(Failure(message: e.message));
    }
  }
}
