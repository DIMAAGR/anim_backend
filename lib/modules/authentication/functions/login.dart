import 'dart:convert';
import 'dart:io';

import 'package:anim_backend/core/constants.dart';
import 'package:anim_backend/shared/models/error_model.dart';
import 'package:shelf/shelf.dart';

class Login {
  Response doLogin(String email, String password) {
    print('ON EXECUTION');

    if (email == 'example@example.com' && password == 'abc123') {
      return Response(200, body: onSuccess(), headers: Const.jsonContentType);
    } else {
      return Response(403, body: onError(), headers: Const.jsonContentType);
    }
  }

  onSuccess() {
    return {
      'user-session': 'sd56fa4das6f4as13v1AD34fg6sS65s4d5f64sd6d',
      'note': 'Attetion: this user session code is valid for 2 hours!',
    }.toString();
  }

  onError() {
    return ErrorModel(code: '403', message: 'this account not exists').toJson().toString();
  }
}
