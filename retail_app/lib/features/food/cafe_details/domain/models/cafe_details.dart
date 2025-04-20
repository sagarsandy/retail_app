class CafeDetails {
  final String id;
  final String name;
  final String address;
  final String deliveryTime;
  final String openTime;
  final String closeTime;
  final bool isAvailableNow;
  final String? phoneNumber;
  final double? rating;
  List<CafeItemCategory>? cafeItemCategories;
  final List<CafeCoupon>? cafeCoupons;

  CafeDetails({
    required this.id,
    required this.name,
    required this.address,
    required this.deliveryTime,
    required this.openTime,
    required this.closeTime,
    this.isAvailableNow = true,
    this.cafeItemCategories,
    this.cafeCoupons,
    this.phoneNumber,
    this.rating,
  });
}

class CafeCoupon {
  final String id;
  final String couponCode;
  final String couponTitle;
  final String? couponDescription;

  CafeCoupon({
    required this.id,
    required this.couponCode,
    required this.couponTitle,
    this.couponDescription,
  });
}

class CafeItemCategory {
  final String name;
  final List<CafeItem>? cafeItems;

  CafeItemCategory({
    required this.name,
    this.cafeItems,
  });
}

class CafeItem {
  final String name;
  final String? description;
  final double price;
  final double originalPrice;
  final String? imageUrl;
  final bool? isVeg;
  final bool? isNonVeg;
  final bool? isEgg;

  CafeItem({
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    this.isVeg = false,
    this.isNonVeg = true,
    this.isEgg = true,
    this.imageUrl,
  });
}
