import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/home/cubit/explore/explore_cafe_cubit.dart';
import 'package:retail_app/features/food/home/cubit/food_category/food_category_cubit.dart';
import 'package:retail_app/features/food/home/cubit/recommended/recommended_cafe_cubit.dart';

import '../features/food/cafe_details/cubit/cafe_details_cubit.dart';
import '../features/food/cart/cubit/cafe_cart_cubit.dart';

Future<void> registerCubits() async {
  _registerFoodCategoryCubit();
  _registerRecommendedCafeCubit();
  _registerExploreCafeCubit();
  _registerCafeDetailsCubit();
  _registerCafeCartCubit();
}

void _registerFoodCategoryCubit() {
  locator.registerLazySingleton<FoodCategoryCubit>(
    () => FoodCategoryCubit(locator.get()),
  );
}

void _registerRecommendedCafeCubit() {
  locator.registerFactory<RecommendedCafeCubit>(
    () => RecommendedCafeCubit(locator.get()),
  );
}

void _registerExploreCafeCubit() {
  locator.registerFactory<ExploreCafeCubit>(
    () => ExploreCafeCubit(locator.get()),
  );
}

void _registerCafeDetailsCubit() {
  locator.registerFactory<CafeDetailsCubit>(
    () => CafeDetailsCubit(locator.get()),
  );
}

void _registerCafeCartCubit() {
  locator.registerLazySingleton<CafeCartCubit>(
    () => CafeCartCubit(),
  );
}
