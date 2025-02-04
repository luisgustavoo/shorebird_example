import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_up/sign_up_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@LazySingleton()
class SignUpDataViewModel {
  SignUpDataViewModel({required SignUpRepository singUpRepository})
      : _singUpRepository = singUpRepository {
    signUp = Command1(_signUp);
  }
  final SignUpRepository _singUpRepository;

  late final Command1<
      bool,
      ({
        String userName,
        String email,
        String password,
        String favoriteColor,
      })> signUp;

  Future<Result<bool>> _signUp(
    ({
      String userName,
      String email,
      String password,
      String favoriteColor,
    }) userData,
  ) async {
    final (
      userName: userName,
      email: email,
      password: password,
      favoriteColor: favoriteColor,
    ) = userData;

    final result = await _singUpRepository.signUp(
      userName: userName,
      email: email,
      password: password,
    );

    return result;
  }
}
