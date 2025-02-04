import 'package:serverpod/serverpod.dart';
import 'package:shorebird_example_server/src/generated/protocol.dart';

class AuthEndpoint extends Endpoint {
  Future<User> createUser(Session session, User userData) async {
    try {
      final user = await User.db.insertRow(session, userData);
      return user;
    } on Exception {
      throw ServerException(errorCode: 500);
    }
  }
}
