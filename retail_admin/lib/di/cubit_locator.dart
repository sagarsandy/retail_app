import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/food_categories/domain/use_case/food_category_use_case.dart';
import 'package:retail_admin/features/food/food_categories/presentation/cubit/food_categories_cubit.dart';
import 'package:retail_admin/features/food/food_items/domain/use_case/food_items_use_case.dart';
import 'package:retail_admin/features/food/food_items/presentation/cubit/food_items_cubit.dart';

Future<void> registerCubits() async {
  _registerFoodCategoriesCubit();
  _registerFoodItemsCubit();
}

void _registerFoodCategoriesCubit() {
  locator.registerFactory<FoodCategoriesCubit>(
    () => FoodCategoriesCubit(
      locator<FoodCategoryUseCase>(),
    ),
  );
}

void _registerFoodItemsCubit() {
  locator.registerFactory<FoodItemsCubit>(
    () => FoodItemsCubit(
      locator<FoodItemsUseCase>(),
    ),
  );
}
