import 'package:anim_backend/shared/uid/uid.dart';

class SignupModel {
  String? id;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? birthday;
  final String? password;

  SignupModel({this.id, this.userName, this.firstName, this.lastName, this.email, this.birthday, this.password});

  SignupModel.fromJson(Map<String, dynamic> json)
      : userName = json['user_name'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        birthday = json['birthday'],
        password = json['password'];

  toJson() => {
        'id': id,
        'user_name': userName,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'birthday': birthday,
        'password': password,
      };

  generateID() => id = UID.generateID().idToInt().toString();
}
