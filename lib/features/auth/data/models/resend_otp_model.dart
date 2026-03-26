class ResendOtpModel {
  final int statusCode;
  final bool succeeded;
  final String message;

  ResendOtpModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
  });

  factory ResendOtpModel.fromJson(Map<String, dynamic> json) {
    return ResendOtpModel(
      statusCode: json['statusCode'],
      succeeded: json['succeeded'] ?? false,
      message: json['message'] ?? '',
    );
  }
}