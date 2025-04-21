import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/home/domain/use_case/explore_cafe_use_case.dart';
import 'package:retail_app/features/food/home/domain/use_case/food_category_use_case.dart';
import 'package:retail_app/features/food/home/domain/use_case/recommended_cafe_use_case.dart';

import '../features/food/cafe_details/domain/use_case/cafe_details_use_case.dart';

Future<void> registerUseCases() async {
  _registerFoodCategoryUseCase();
  _registerRecommendedCafeUseCase();
  _registerExploreCafeUseCase();
  _registerCafeDetailsUseCase();
}

void _registerFoodCategoryUseCase() {
  locator.registerFactory<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(),
  );
}

void _registerRecommendedCafeUseCase() {
  locator.registerFactory<RecommendedCafeUseCase>(
    () => RecommendedCafeUseCase(),
  );
}

void _registerExploreCafeUseCase() {
  locator.registerFactory<ExploreCafeUseCase>(
    () => ExploreCafeUseCase(),
  );
}

void _registerCafeDetailsUseCase() {
  locator.registerFactory<CafeDetailsUseCase>(
    () => CafeDetailsUseCase(),
  );
}
