import '../models/food_item.dart';

abstract class FoodItemsRepository {
  Future<List<FoodItem>> getFoodItems();
  Future<List<FoodItem>> getFoodItemsByCategory(String categoryId);
  Future<void> addFoodItem(FoodItem foodItem);
  Future<void> updateFoodItem(FoodItem foodItem);
  Future<void> deleteFoodItem(String id);
  Future<void> toggleFoodItemAvailability(String id);
}
