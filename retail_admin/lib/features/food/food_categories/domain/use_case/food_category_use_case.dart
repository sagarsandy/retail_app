import '../models/food_category.dart';

class FoodCategoryUseCase {
  // final FoodCategoriesRepository _repository;

  // FoodCategoryUseCase(this._repository);
  FoodCategoryUseCase();

  List<FoodCategory> _foodCategories = [];

  Future<List<FoodCategory>> getFoodCategories() async {
    return _foodCategories;
  }

  Future<List<FoodCategory>> addFoodCategory(FoodCategory foodCategory) async {
    _foodCategories.add(foodCategory);
    return _foodCategories;
  }

  Future<List<FoodCategory>> updateFoodCategory(
      FoodCategory foodCategory) async {
    final index =
        _foodCategories.indexWhere((cat) => cat.id == foodCategory.id);
    if (index != -1) {
      _foodCategories[index] = foodCategory;
    }
    return _foodCategories;
  }

  Future<List<FoodCategory>> deleteFoodCategory(String id) async {
    _foodCategories.removeWhere((cat) => cat.id == id);
    return _foodCategories;
  }
}
