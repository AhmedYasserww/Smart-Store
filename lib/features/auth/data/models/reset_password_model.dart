class ResetPasswordModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final ResetPasswordData? data;

  ResetPasswordModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      statusCode: json["statusCode"],
      succeeded: json["succeeded"] ?? false,
      message: json["message"] ?? '',
      data: json["data"] != null
          ? ResetPasswordData.fromJson(json["data"])
          : null,
    );
  }
}
class ResetPasswordData {
  final String userId;
  final String email;
  final String phoneNumber;
  final String role;

  ResetPasswordData({
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) {
    return ResetPasswordData(
      userId: json["userId"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      role: json["role"],
    );
  }
}