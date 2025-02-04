import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:shorebird_example_client/shorebird_example_client.dart';
import 'package:shorebird_example_flutter/data/services/api/environment/env.dart';

late SessionManager sessionManager;
late Client client;
late EmailAuthController emailAuthController;

Future<void> initializeServerpodClient() async {
  client = Client(
    Env.baseUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );

  await sessionManager.initialize();

  emailAuthController = EmailAuthController(client.modules.auth);
}
