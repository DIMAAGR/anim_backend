import 'package:anim_backend/core/constants.dart';
import 'package:anim_backend/log/log.dart';
import 'package:anim_backend/shared/data_base/db.dart';
import 'package:anim_backend/shared/models/error_model.dart';
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
      sessionTime: DateTime.now().add(const Duration(seconds: Const.sessionDurationTimeInSeconds)).millisecondsSinceEpoch.toString(),
      userID: 'UID',
    );

    (await HiveDB.sessionsDB).put(
      session.sessionID,
      {'userID': session.userID, 'sessionTime': session.sessionTime},
    );

    return session;
  }

  Future<dynamic> getSessionData() async {
    bool isSessionValid = Uuid.isValidUUID(fromString: _sessionCode ?? 'NULL');

    if (isSessionValid) {
      Map<dynamic, dynamic>? sessionData = await (await HiveDB.sessionsDB).get(sessionID);

      if (sessionData == null) return ErrorModel(code: '401', message: 'session does not exists, UNAUTHORIZED');

      return UserSession.session(
        sessionCode: _sessionCode!,
        sessionTime: sessionData['sessionTime'],
        userID: sessionData['userID'],
      );
    } else {
      return ErrorModel(code: '401', message: 'invalid session code, UNAUTHORIZED');
    }
  }

  removeSession() {}

  bool isSessionTimeValid() {
    String actualTime = DateTime.now().millisecondsSinceEpoch.toString();

    if (int.tryParse(_endtime!) == null) {
      Log.error('INT_01', 'UserSession CLASS >> the **_endtime** is null');
      return false;
    }

    if (int.parse(actualTime) >= int.parse(_endtime!)) {
      Log.info('EXP_01', 'UserSession CLASS >> the session from $_sessionCode has been expired!');
      return false;
    } else {
      return true;
    }
  }
}
