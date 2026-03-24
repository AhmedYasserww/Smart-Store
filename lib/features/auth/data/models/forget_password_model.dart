class ForgetPasswordModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final ForgetPasswordData? data;

  ForgetPasswordModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      statusCode: json['statusCode'],
      succeeded: json['succeeded'],
      message: json['message'],
      data: json['data'] != null
          ? ForgetPasswordData.fromJson(json['data'])
          : null,
    );
  }
}

class ForgetPasswordData {
  final String userId;

  ForgetPasswordData({required this.userId});

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordData(
      userId: json['userId'],
    );
  }
}