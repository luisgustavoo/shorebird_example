import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/data/repositories/sign_up/sign_up_repository.dart';
import 'package:shorebird_example_flutter/utils/command.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

@injectable
class SignUpDataValidationViewModel {
  SignUpDataValidationViewModel({
    required SignUpRepository singUpRepository,
  }) : _singUpRepository = singUpRepository {
    validateAccount = Command1(_validateAccount);
  }
  final SignUpRepository _singUpRepository;

  late final Command1<
      bool,
      ({
        String email,
        String verificationCode,
        String? favoriteColor,
      })> validateAccount;

  Future<Result<bool>> _validateAccount(
    ({
      String email,
      String verificationCode,
      String? favoriteColor,
    }) data,
  ) async {
    final (
      email: email,
      verificationCode: verificationCode,
      favoriteColor: favoriteColor,
    ) = data;
    final result = await _singUpRepository.validateAccount(
      email: email,
      verificationCode: verificationCode,
      favoriteColor: favoriteColor,
    );
    return result;
  }
}
