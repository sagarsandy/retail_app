import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/food_categories/domain/use_case/food_category_use_case.dart';
import 'package:retail_admin/features/food/food_items/domain/use_case/food_items_use_case.dart';
import 'package:retail_admin/features/food/reviews/domain/use_case/reviews_use_case.dart';

Future<void> registerUseCases() async {
  _registerFoodCategoriesUseCase();
  _registerFoodItemsUseCase();
  _registerReviewsUseCase();
}

void _registerFoodCategoriesUseCase() {
  locator.registerLazySingleton<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(),
  );
}

void _registerFoodItemsUseCase() {
  locator.registerLazySingleton<FoodItemsUseCase>(
    () => FoodItemsUseCase(),
  );
}

void _registerReviewsUseCase() {
  locator.registerLazySingleton<ReviewsUseCase>(
    () => ReviewsUseCase(),
  );
}
