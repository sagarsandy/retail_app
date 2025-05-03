import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/favourite/presentation/domain/use_case/favourite_use_case.dart';
import 'package:retail_app/features/food/home/domain/use_case/explore_cafe_use_case.dart';
import 'package:retail_app/features/food/home/domain/use_case/food_category_use_case.dart';
import 'package:retail_app/features/food/home/domain/use_case/recommended_cafe_use_case.dart';
import 'package:retail_app/features/food/orders/domain/use_case/orders_use_case.dart';

import '../features/food/cafe_details/domain/use_case/cafe_details_use_case.dart';

Future<void> registerUseCases() async {
  _registerFoodCategoryUseCase();
  _registerFavouriteUseCase();
  _registerRecommendedCafeUseCase();
  _registerExploreCafeUseCase();
  _registerCafeDetailsUseCase();
  _registerOrderUseCase();
}

void _registerFoodCategoryUseCase() {
  locator.registerLazySingleton<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(),
  );
}

void _registerFavouriteUseCase() {
  locator.registerLazySingleton<FavouriteUseCase>(
    () => FavouriteUseCase(),
  );
}

void _registerRecommendedCafeUseCase() {
  locator.registerLazySingleton<RecommendedCafeUseCase>(
    () => RecommendedCafeUseCase(),
  );
}

void _registerExploreCafeUseCase() {
  locator.registerLazySingleton<ExploreCafeUseCase>(
    () => ExploreCafeUseCase(),
  );
}

void _registerCafeDetailsUseCase() {
  locator.registerLazySingleton<CafeDetailsUseCase>(
    () => CafeDetailsUseCase(),
  );
}

void _registerOrderUseCase() {
  locator.registerFactory<OrdersUseCase>(
    () => OrdersUseCase(),
  );
}
