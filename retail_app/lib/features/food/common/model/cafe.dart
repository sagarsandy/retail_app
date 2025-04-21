class Cafe {
  final String id;
  final String name;
  final String address;
  final String deliveryTime;
  final String openTime;
  final String closeTime;
  final bool isAvailableNow;
  final String category;
  final String? imageUrl;
  final String? phoneNumber;
  final double? rating;

  Cafe({
    required this.id,
    required this.name,
    required this.address,
    required this.deliveryTime,
    required this.openTime,
    required this.closeTime,
    required this.category,
    this.imageUrl,
    this.isAvailableNow = true,
    this.phoneNumber,
    this.rating,
  });
}
