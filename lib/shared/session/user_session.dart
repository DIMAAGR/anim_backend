import 'package:anim_backend/shared/data_base/db.dart';
import 'package:uuid/uuid.dart';

class UserSession {
  final String? _email;
  final String? _password;
  final String? _sessionCode;

  String? _endtime;
  String? _userID;

  UserSession({required String email, required String password})
      : _email = email,
        _password = password,
        _sessionCode = null;

  UserSession.fromSession({required String sessionCode})
      : _sessionCode = sessionCode,
        _password = null,
        _email = null;

  UserSession.session({required String sessionCode, required String sessionTime, required String userID})
      : _sessionCode = sessionCode,
        _password = null,
        _email = null,
        _endtime = sessionTime,
        _userID = userID;

  String get sessionID => _sessionCode ?? 'NULL';
  String get sessionTime => _endtime ?? 'NULL';
  String get userID => _userID ?? 'NULL';

  createSession() async {
    Uuid uuid = Uuid();

    UserSession session = UserSession.session(
      sessionCode: uuid.v4(),
      sessionTime: DateTime.now().add(const Duration(hours: 8)).millisecondsSinceEpoch.toString(),
      userID: 'UID',
    );

    (await HiveDB.sessionsDB).put(
      session.sessionID,
      {'userID': session.userID, 'sessionTime': session.sessionTime},
    );

    return session;
  }

  getSessionData() {
    
  }

  removeSession() {}

  checkSessionTime() {}
}
