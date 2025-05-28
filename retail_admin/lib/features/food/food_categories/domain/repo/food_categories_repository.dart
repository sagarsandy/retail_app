import '../models/food_category.dart';

abstract class FoodCategoriesRepository {
  Future<List<FoodCategory>> getFoodCategories();
  Future<void> addFoodCategory(FoodCategory foodCategory);
  Future<void> updateFoodCategory(FoodCategory foodCategory);
  Future<void> deleteFoodCategory(String id);
}
