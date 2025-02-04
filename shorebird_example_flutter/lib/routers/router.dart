import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/config/app_config.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/home/view_models/home_page_view_model.dart';
import 'package:shorebird_example_flutter/ui/home/widgets/home_page_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_in/view_models/sign_in_view_model.dart';
import 'package:shorebird_example_flutter/ui/sign_in/widgets/sign_in_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_validation_view_model.dart';
import 'package:shorebird_example_flutter/ui/sign_up/view_models/sign_up_data_view_model.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_data_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_data_validation_screen.dart';
import 'package:shorebird_example_flutter/ui/sign_up/widgets/sign_up_screen.dart';

final router = GoRouter(
  initialLocation: Routes.signin,
  refreshListenable: sessionManager,
  redirect: _redirect,
  debugLogDiagnostics: true,
  routes: [
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
              favoriteColor: signUpDataValidationScreenParams?.favoriteColor,
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
          homePageViewModel: getIt<HomePageViewModel>()..getUser.execute(),
        );
      },
    ),
  ],
);

FutureOr<String?> _redirect(
  BuildContext context,
  GoRouterState state,
) {
  final isSignedIn = sessionManager.isSignedIn;
  final loggingIn = state.matchedLocation == Routes.signin;
  final registering = state.fullPath?.startsWith(Routes.signup) ?? false;

  if (registering) {
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
