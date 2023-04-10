class ErrorModel {
  final String code;
  final String message;

  ErrorModel({required this.code, required this.message});

  toJson() => {'code' : code, 'message' : message};
}
