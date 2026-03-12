class LoginModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final LoginData? data;

  LoginModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      statusCode: json["statusCode"],
      succeeded: json["succeeded"],
      message: json["message"],
      data: json["data"] != null ? LoginData.fromJson(json["data"]) : null,
    );
  }
}

class LoginData {
  final String id;
  final String email;
  final String phoneNumber;
  final String role;
  final bool isEmailConfirmed;
  final String accessToken;
  final String refreshToken;

  LoginData({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.isEmailConfirmed,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      id: json["id"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      role: json["role"],
      isEmailConfirmed: json["isEmailConfirmed"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}