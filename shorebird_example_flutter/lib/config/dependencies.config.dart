// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/repositories/sign_in/sign_in_repository.dart' as _i194;
import '../data/repositories/sign_in/sign_in_repository_remote.dart' as _i646;
import '../data/repositories/sign_up/sign_up_repository.dart' as _i525;
import '../data/repositories/sign_up/sing_up_repository_remote.dart' as _i208;
import '../data/repositories/update/update_repository.dart' as _i522;
import '../data/repositories/update/update_repository_beta.dart' as _i699;
import '../data/repositories/update/update_repository_prod.dart' as _i1054;
import '../data/repositories/update/update_repository_staging.dart' as _i83;
import '../data/repositories/user/user_repository.dart' as _i958;
import '../data/repositories/user/user_repository_local.dart' as _i809;
import '../data/repositories/user/user_repository_remote.dart' as _i570;
import '../data/services/api/auth/auth_api_client.dart' as _i1057;
import '../data/services/api/user/user_api_client.dart' as _i530;
import '../data/services/local/auth/local_auth_service.dart' as _i33;
import '../data/services/local/user/local_user_service.dart' as _i930;
import '../data/services/shared_preferences_service.dart' as _i375;
import '../ui/home/view_models/home_page_view_model.dart' as _i726;
import '../ui/sign_in/view_models/sign_in_view_model.dart' as _i509;
import '../ui/sign_up/view_models/sign_up_data_validation_view_model.dart'
    as _i161;
import '../ui/sign_up/view_models/sign_up_data_view_model.dart' as _i887;
import '../ui/splash/view_models/splash_view_model.dart' as _i37;

const String _prod = 'prod';
const String _staging = 'staging';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1057.AuthApiClient>(() => _i1057.AuthApiClient());
    gh.factory<_i530.UserApiClient>(() => _i530.UserApiClient());
    gh.factory<_i525.SignUpRepository>(
      () => _i208.SingUpRepositoryRemote(
          authApiClient: gh<_i1057.AuthApiClient>()),
      registerFor: {
        _prod,
        _staging,
      },
    );
    gh.lazySingleton<_i522.UpdateRepository>(
      () => _i83.UpdateRepositoryStaging(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i522.UpdateRepository>(
      () => _i699.UpdateRepositoryBeta(),
      registerFor: {_staging},
    );
    gh.factory<_i375.SharedPreferencesService>(
      () => _i375.SharedPreferencesService(),
      registerFor: {_dev},
    );
    gh.factory<_i33.LocalAuthService>(() => _i33.LocalAuthService(
        sharedPreferencesService: gh<_i375.SharedPreferencesService>()));
    gh.factory<_i194.SignInRepository>(
      () => _i646.SignInRepositoryRemote(
          authApiClient: gh<_i1057.AuthApiClient>()),
      registerFor: {
        _prod,
        _staging,
      },
    );
    gh.lazySingleton<_i887.SignUpDataViewModel>(() => _i887.SignUpDataViewModel(
        singUpRepository: gh<_i525.SignUpRepository>()));
    gh.lazySingleton<_i161.SignUpDataValidationViewModel>(() =>
        _i161.SignUpDataValidationViewModel(
            singUpRepository: gh<_i525.SignUpRepository>()));
    gh.lazySingleton<_i37.SplashViewModel>(() =>
        _i37.SplashViewModel(updateRepository: gh<_i522.UpdateRepository>()));
    gh.lazySingleton<_i509.SignInViewModel>(() =>
        _i509.SignInViewModel(signInRepository: gh<_i194.SignInRepository>()));
    gh.lazySingleton<_i522.UpdateRepository>(
      () => _i1054.UpdateRepositoryProd(),
      registerFor: {_prod},
    );
    gh.factory<_i958.UserRepository>(
      () =>
          _i570.UserRepositoryRemote(userApiClient: gh<_i530.UserApiClient>()),
      registerFor: {
        _prod,
        _staging,
      },
    );
    gh.factory<_i930.LocalUserService>(
      () => _i930.LocalUserService(
          sharedPreferencesService: gh<_i375.SharedPreferencesService>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i726.HomePageViewModel>(() =>
        _i726.HomePageViewModel(userRepository: gh<_i958.UserRepository>()));
    gh.factory<_i958.UserRepository>(
      () => _i809.UserRepositoryLocal(
          localUserService: gh<_i930.LocalUserService>()),
      registerFor: {_dev},
    );
    return this;
  }
}
