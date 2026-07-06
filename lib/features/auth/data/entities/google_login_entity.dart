class GoogleLoginEntity {
  final String userId;
  final String accessToken;
  final String refreshToken;
  final String userName;
  final String roles;
  final String email;

  GoogleLoginEntity({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
    required this.userName,
    required this.roles,
    required this.email,
  });
}