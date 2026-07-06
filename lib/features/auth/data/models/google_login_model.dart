import '../entities/google_login_entity.dart';

class GoogleLoginModel extends GoogleLoginEntity {
  GoogleLoginModel({
    required super.userId,
    required super.accessToken,
    required super.refreshToken,
    required super.userName,
    required super.roles,
    required super.email,
  });

  factory GoogleLoginModel.fromJson(Map<String, dynamic> json) {
    return GoogleLoginModel(
      userId: json['userId'] ?? '',
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      userName: json['userName'] ?? '',
      roles: json['roles'] ?? '',
      email: json['email'] ?? '',
    );
  }
}