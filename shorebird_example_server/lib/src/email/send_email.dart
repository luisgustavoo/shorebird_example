import 'package:logging/logging.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';

class SendEmail {
  SendEmail(Logger log) : _log = log;

  final Logger _log;

  Future<bool> sendEmail(
    Session session,
    String email,
    String validationCode,
  ) async {
    Logger.root.level = Level.CONFIG;
    Logger.root.onRecord.listen((rec) {
      _log.info('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
    final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

    final smtpServer = gmail(
      gmailEmail,
      gmailPassword,
    );

    final message = Message()
      ..from = Address(gmailEmail, 'Shorebird Example 😀')
      ..recipients.addAll([email])
      ..subject = 'Código de verificação'
      ..html = '<h2>Código de verificação</h12>\n<h1>$validationCode</h1>';

    try {
      final sendReport = await send(
        message,
        smtpServer,
        timeout: const Duration(seconds: 15),
      );

      _log.info('Message sent: $sendReport');
      return true;
    } on MailerException catch (e) {
      _log.info('Message not sent.');
      for (final p in e.problems) {
        _log.info('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
  }
}
