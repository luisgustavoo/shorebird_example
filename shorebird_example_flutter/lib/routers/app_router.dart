import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/data/repositories/auth/auth_repository.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_in/view_models/sign_in_view_model.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_in/widgets/sign_in_screen.dart';
import 'package:shorebird_example_flutter/ui/home/view_models/home_page_view_model.dart';
import 'package:shorebird_example_flutter/ui/home/widgets/home_page_screen.dart';
import 'package:shorebird_example_flutter/ui/shorebird/shorebird_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_validation_view_model.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_view_model.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_data_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_data_validation_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_screen.dart';
import 'package:shorebird_example_flutter/ui/splash/view_models/splash_view_model.dart';
import 'package:shorebird_example_flutter/ui/splash/widgets/splash_screen.dart';
import 'package:shorebird_example_flutter/ui/update/view_models/update_view_model.dart';
import 'package:shorebird_example_flutter/ui/update/widgets/update_screen.dart';

@injectable
class AppRouter {
  AppRouter({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  GoRouter get router => GoRouter(
        initialLocation: Routes.splash,
        refreshListenable: _authRepository,
        redirect: _redirect,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: Routes.splash,
            builder: (context, state) {
              return SplashScreen(
                splashViewModel: getIt<SplashViewModel>(),
              );
            },
          ),
          ShellRoute(
            builder: (context, state, child) {
              return SignUpScreen(
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: Routes.signup,
                builder: (context, state) {
                  return SignUpDataScreen(
                    signUpDataViewModel: getIt<SignUpDataViewModel>(),
                  );
                },
              ),
              GoRoute(
                path: Routes.signupValidation,
                builder: (context, state) {
                  final signUpDataValidationScreenParams =
                      state.extra as SignUpDataValidationScreenParams?;
                  return SignUpDataValidationScreen(
                    signUpDataValidationViewModel:
                        getIt<SignUpDataValidationViewModel>(),
                    email: signUpDataValidationScreenParams?.email ?? '',
                    favoriteColor:
                        signUpDataValidationScreenParams?.favoriteColor,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.signin,
            builder: (context, state) {
              return SignInScreen(
                signInViewModel: getIt<SignInViewModel>(),
              );
            },
          ),
          GoRoute(
            path: Routes.home,
            builder: (context, state) {
              return HomePageScreen(
                homePageViewModel: getIt<HomePageViewModel>(),
              );
            },
          ),
          GoRoute(
            path: Routes.update,
            builder: (context, state) {
              return UpdateScreen(
                updateViewModel: getIt<UpdateViewModel>(),
              );
            },
          ),
          GoRoute(
            path: '/shorebird',
            builder: (context, state) {
              return const ShorebirdScreen();
            },
          ),
        ],
      );

  FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    final isSignedIn = await _authRepository.isAuthenticated;

    final loggingIn = state.matchedLocation == Routes.signin;
    final isSplash = state.matchedLocation == Routes.splash;
    final isUpdate = state.matchedLocation == Routes.update;
    final registering = state.fullPath?.startsWith(Routes.signup) ?? false;

    if (registering || isSplash || isUpdate) {
      return null;
    }

    if (!isSignedIn) {
      return Routes.signin;
    }

    if (loggingIn) {
      return Routes.home;
    }

    return null;
  }
}
