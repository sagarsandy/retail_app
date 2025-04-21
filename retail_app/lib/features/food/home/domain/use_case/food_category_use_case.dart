import 'package:retail_app/features/food/common/model/food_category.dart';
import 'package:retail_app/features/food/home/domain/models/home_test_data.dart';

class FoodCategoryUseCase {
  final HomeTestData homeTestData = HomeTestData();

  Future<List<FoodCategory>> getFoodCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return homeTestData.foodCategoryData();
  }
}
