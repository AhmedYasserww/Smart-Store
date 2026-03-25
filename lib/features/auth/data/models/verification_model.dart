class VerificationModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final bool? data;
  final String? token;

  VerificationModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
    this.token,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(
      statusCode: json["statusCode"],
      succeeded: json["succeeded"] ?? false,
      message: json["message"] ?? '',
      data: json["data"] is bool ? json["data"] : null,
      token: json["data"] is Map ? json["data"]["token"] : null,
    );
  }
}