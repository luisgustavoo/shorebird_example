import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:shorebird_example_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<User?> getUser(Session session) async {
    try {
      final authenticationInfo = await session.authenticated;
      final userInfoId = authenticationInfo?.userId;

      if (userInfoId != null) {
        // final userInfo = await UserInfo.db.findById(session, userInfoId);
        final users = await User.db.find(
          session,
          where: (t) => t.userInfoId.equals(userInfoId),
          limit: 1,
          include: User.include(
            userInfo: UserInfo.include(),
          ),
        );

        return users.first;
      }

      return null;
    } on Exception {
      throw ServerException(errorCode: 500);
    }
  }
}
