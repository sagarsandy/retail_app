class FoodCategory {
  final String id;
  final String title;

  FoodCategory({
    required this.id,
    required this.title,
  });

  FoodCategory copyWith({
    String? id,
    String? title,
  }) {
    return FoodCategory(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  @override
  String toString() => 'FoodCategory(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodCategory && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
