import 'package:anim_backend/modules/authentication/models/signup_model.dart';
import 'package:anim_backend/shared/models/error_model.dart';
import 'package:shelf/shelf.dart';

class Signup {
  Response doSignup(Map<String, dynamic> data) {
    SignupModel signupModel = SignupModel.fromJson(data);
    signupModel.generateID();

    print('USER UID: ${signupModel.id}');

    return Response.ok('Testing');
  }

  onError(String code) {
    if (code == '500' || code == '') return ErrorModel(code: '500', message: 'A UNKNOWN ERROR HAS OCCOURRED');
  }
}
