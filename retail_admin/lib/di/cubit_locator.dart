import 'package:retail_admin/di/service_locator.dart';
import 'package:retail_admin/features/food/food_categories/domain/use_case/food_category_use_case.dart';
import 'package:retail_admin/features/food/food_categories/presentation/cubit/food_categories_cubit.dart';

Future<void> registerCubits() async {
  _registerFoodCategoriesCubit();
}

void _registerFoodCategoriesCubit() {
  locator.registerFactory<FoodCategoriesCubit>(
    () => FoodCategoriesCubit(
      locator<FoodCategoryUseCase>(),
    ),
  );
}
