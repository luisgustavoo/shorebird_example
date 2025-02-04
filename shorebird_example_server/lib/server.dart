import 'package:logging/logging.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:shorebird_example_server/src/email/send_email.dart';

import 'package:shorebird_example_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        Logger('AuthConfig').info(validationCode);
        final emailProvider = SendEmail(Logger('SendEmail'));
        // Send the validation email to the user.
        // Return `true` if the email was successfully sent, otherwise `false`.

        return emailProvider.sendEmail(
          session,
          email,
          validationCode,
        );
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        // Send the password reset email to the user.
        // Return `true` if the email was successfully sent, otherwise `false`.
        return true;
      },
    ),
  );

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
}
