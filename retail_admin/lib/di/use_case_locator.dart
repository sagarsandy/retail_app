import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/food_categories/domain/use_case/food_category_use_case.dart';

Future<void> registerUseCases() async {
  _registerFoodCategoryUseCase();
}

void _registerFoodCategoryUseCase() {
  locator.registerLazySingleton<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(),
  );
}
