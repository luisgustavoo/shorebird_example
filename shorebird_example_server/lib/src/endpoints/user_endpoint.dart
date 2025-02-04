import 'package:serverpod/serverpod.dart';
import 'package:shorebird_example_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<User?> findUser(Session session) async {
    try {
      final userInfoId = (await session.authenticated)?.userId;
      if (userInfoId != null) {
        final users = await User.db.find(
          session,
          where: (t) => t.userInfoId.equals(userInfoId),
          limit: 1,
        );

        return users.first;
      }

      return null;
    } on Exception {
      throw ServerException(errorCode: 500);
    }
  }
}
