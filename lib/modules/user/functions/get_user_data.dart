import 'package:anim_backend/core/constants.dart';
import 'package:anim_backend/shared/models/error_model.dart';
import 'package:anim_backend/shared/session/user_session.dart';
import 'package:shelf/shelf.dart';

class UserData {
  static Future<Response> getUserData(String uuid) async {
    dynamic session = await UserSession.fromSession(sessionCode: uuid).getSessionData();

    if (session is ErrorModel) {
      return Response(int.parse(session.code), body: session.toString(), headers: Const.jsonContentType);
    } else if (session is UserSession) {
      if (session.isSessionTimeValid()) {
        return Response(
          200,
          body: {'user_name': 'TEST', 'user_email': 'example@example.com', 'phone_number': '(00) 00000-0000', 'birthday': '00/00/0000', 'user_id': session.userID}.toString(),
          headers: Const.jsonContentType,
        );
      } else {
        return Response(401, body: onError(401).toString(), headers: Const.jsonContentType);
      }
    }

    return Response(400, body: onError(400).toString(), headers: Const.jsonContentType);
  }

  static onError(int code) {
    if (code == 400) return ErrorModel(code: '400', message: 'invalid session code');
    if (code == 401) return ErrorModel(code: '401', message: 'session expired');
    return ErrorModel(code: '500', message: 'internal server error');
  }
}
