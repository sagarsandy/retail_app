import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:retail_app/features/food/home/cubit/explore/explore_cafe_cubit.dart';
import 'package:retail_app/features/food/home/cubit/food_category/food_category_cubit.dart';
import 'package:retail_app/features/food/home/cubit/recommended/recommended_cafe_cubit.dart';
import 'package:retail_app/features/mart/home/cubit/mart_categories_cubit.dart';

import '../features/food/cafe_details/cubit/cafe_details_cubit.dart';
import '../features/food/cart/cubit/cafe_cart_cubit.dart';
import '../features/food/orders/cubit/orders_cubit.dart';

Future<void> registerCubits() async {
  _registerFoodCubits();
  _registerMartCubits();
}

void _registerFoodCubits() {
  _registerFoodCategoryCubit();
  _registerFavouriteCubit();
  _registerRecommendedCafeCubit();
  _registerExploreCafeCubit();
  _registerCafeDetailsCubit();
  _registerCafeCartCubit();
  _registerOrderCubit();
}

void _registerMartCubits() {
  _registerMartCategoriesCubit();
}

void _registerFoodCategoryCubit() {
  locator.registerLazySingleton<FoodCategoryCubit>(
    () => FoodCategoryCubit(locator.get()),
  );
}

void _registerFavouriteCubit() {
  locator.registerLazySingleton<FavouriteCubit>(
    () => FavouriteCubit(locator.get()),
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

void _registerOrderCubit() {
  locator.registerFactory<OrdersCubit>(
    () => OrdersCubit(locator.get()),
  );
}

void _registerMartCategoriesCubit() {
  locator.registerFactory<MartCategoriesCubit>(
    () => MartCategoriesCubit(locator.get()),
  );
}
