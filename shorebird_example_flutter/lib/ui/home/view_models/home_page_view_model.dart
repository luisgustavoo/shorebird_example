import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/repositories/user/user_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel({
    required UserRepository userRepository,
  }) : _userRepository = userRepository {
    getUser = Command0(_getUser);
  }
  final UserRepository _userRepository;
  late final Command0<void> getUser;
  User? user;

  Future<Result<void>> _getUser() async {
    final result = await _userRepository.getUser();
    switch (result) {
      case Ok<User?>():
        user = result.value;
        notifyListeners();
        return Result.ok();
      case Error<User?>():
        return Result.error(result.error);
    }
  }
}
