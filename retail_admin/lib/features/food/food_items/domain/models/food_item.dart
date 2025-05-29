class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String categoryId;
  final String imageUrl;
  final bool isAvailable;
  final bool isVeg;
  final bool isEgg;
  final bool isNonVeg;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.categoryId,
    required this.imageUrl,
    this.isAvailable = true,
    required this.isVeg,
    required this.isEgg,
    required this.isNonVeg,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    String? categoryId,
    String? imageUrl,
    bool? isAvailable,
    bool? isVeg,
    bool? isEgg,
    bool? isNonVeg,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      categoryId: categoryId ?? this.categoryId,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      isVeg: isVeg ?? this.isVeg,
      isEgg: isEgg ?? this.isEgg,
      isNonVeg: isNonVeg ?? this.isNonVeg,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'categoryId': categoryId,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'isVeg': isVeg,
      'isEgg': isEgg,
      'isNonVeg': isNonVeg,
    };
  }

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null
          ? (json['originalPrice'] as num).toDouble()
          : null,
      categoryId: json['categoryId'] as String,
      imageUrl: json['imageUrl'] as String,
      isAvailable: json['isAvailable'] as bool? ?? true,
      isVeg: json['isVeg'] as bool? ?? false,
      isEgg: json['isEgg'] as bool? ?? false,
      isNonVeg: json['isNonVeg'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return 'FoodItem(id: $id, name: $name, description: $description, price: $price, originalPrice: $originalPrice, categoryId: $categoryId, imageUrl: $imageUrl, isAvailable: $isAvailable, isVeg: $isVeg, isEgg: $isEgg, isNonVeg: $isNonVeg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodItem &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.originalPrice == originalPrice &&
        other.categoryId == categoryId &&
        other.imageUrl == imageUrl &&
        other.isAvailable == isAvailable &&
        other.isVeg == isVeg &&
        other.isEgg == isEgg &&
        other.isNonVeg == isNonVeg;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        originalPrice.hashCode ^
        categoryId.hashCode ^
        imageUrl.hashCode ^
        isAvailable.hashCode ^
        isVeg.hashCode ^
        isEgg.hashCode ^
        isNonVeg.hashCode;
  }
}
