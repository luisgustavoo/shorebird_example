import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/core/errors/failure.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@injectable
class SharedPreferencesService {
  final _log = Logger('SharedPreferencesService');

  Future<void> saveUser(User user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _log.finer('Salvando dados do usuário no shared_preference');
    await sharedPreferences.setString(
      'user',
      jsonEncode(user.toJson()),
    );
  }

  Future<Result<User?>> getUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final userJson = sharedPreferences.getString('user');
    if (userJson != null) {
      return Result.ok(
        User.fromJson(jsonDecode(userJson) as Map<String, dynamic>),
      );
    }
    return Result.error(Failure(message: 'Usuário não está logado'));
  }

  Future<Result<void>> clear() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      return Result.ok();
    } on Exception {
      return Result.error(
        Failure(
          message: 'Erro ao limpar dados locais',
        ),
      );
    }
  }
}
