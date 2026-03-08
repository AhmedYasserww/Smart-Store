class RegisterModel {
  final int statusCode;
  final bool succeeded;
  final String message;
  final RegisterData? data;

  RegisterModel({
    required this.statusCode,
    required this.succeeded,
    required this.message,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      statusCode: json["statusCode"],
      succeeded: json["succeeded"],
      message: json["message"],
      data: json["data"] != null ? RegisterData.fromJson(json["data"]) : null,
    );
  }
}

class RegisterData {
  final String id;
  final String email;
  final String phoneNumber;
  final String fullName;
  final int age;
  final String address;
  final String? profileImageUrl;
  final String accessToken;
  final String refreshToken;
  final String role;
  final bool isEmailConfirmed;

  RegisterData({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.age,
    required this.address,
    required this.profileImageUrl,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.isEmailConfirmed,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json["id"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      fullName: json["fullName"],
      age: json["age"],
      address: json["address"],
      profileImageUrl: json["profileImageUrl"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      role: json["role"],
      isEmailConfirmed: json["isEmailConfirmed"],
    );
  }
}