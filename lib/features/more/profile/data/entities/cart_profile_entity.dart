
class ClientProfileEntity {
  final String id;
  final String fullName;
  final int age;
  final String address;
  final String? profileImageUrl;
  final bool isActive;
  final String email;
  final String createdAt;
  final int ordersCount;
  final int ratingsCount;

  ClientProfileEntity({
    required this.id,
    required this.fullName,
    required this.age,
    required this.address,
    required this.profileImageUrl,
    required this.isActive,
    required this.email,
    required this.createdAt,
    required this.ordersCount,
    required this.ratingsCount,
  });
}