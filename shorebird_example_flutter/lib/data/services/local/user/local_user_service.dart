import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/services/shared_preferences_service.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@dev
@injectable
class LocalUserService {
  LocalUserService({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  Future<Result<User?>> getUser() async {
    return _sharedPreferencesService.getUser();
  }
}
