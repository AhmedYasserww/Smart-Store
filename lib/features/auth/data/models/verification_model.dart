class VerificationModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final bool? data;

  VerificationModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(
      statusCode: json["statusCode"],
      succeeded: json["succeeded"] ?? false,
      message: json["message"] ?? '',
      data: json["data"],
    );
  }
}