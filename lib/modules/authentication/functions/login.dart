import 'package:anim_backend/core/constants.dart';
import 'package:anim_backend/shared/models/error_model.dart';
import 'package:anim_backend/shared/session/user_session.dart';
import 'package:shelf/shelf.dart';

class Login {
  Future<Response> doLogin(String email, String password) async {
    if (email == 'example@example.com' && password == 'abc123') {
      UserSession userSession = await UserSession(email: email, password: password).createSession();
      

      return Response(200, body: onSuccess(userSession.sessionID), headers: Const.jsonContentType);
    } else {
      return Response(403, body: onError().toString(), headers: Const.jsonContentType);
    }
  }

  onSuccess(String sessionCode) {
    return {
      'user-session': sessionCode,
      'note': 'Attetion: this user session code is valid for 8 hours!',
    }.toString();
  }

  onError() {
    return ErrorModel(code: '403', message: 'this account not exists');
  }
}
