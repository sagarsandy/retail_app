import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';

class FoodItemCategory {
  final String name;
  final List<FoodItem>? foodItems;

  FoodItemCategory({
    required this.name,
    this.foodItems,
  });
}
