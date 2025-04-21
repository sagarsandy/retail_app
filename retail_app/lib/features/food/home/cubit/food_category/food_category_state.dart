import 'package:retail_app/features/food/common/model/food_category.dart';

abstract class FoodCategoryState {
  const FoodCategoryState();
}

class FoodCategoryInitialState extends FoodCategoryState {
  const FoodCategoryInitialState();
}

class FoodCategoryLoadingState extends FoodCategoryState {
  const FoodCategoryLoadingState();
}

class FoodCategoryLoadedState extends FoodCategoryState {
  final List<FoodCategory> categories;

  const FoodCategoryLoadedState({required this.categories});
}

class FoodCategoryErrorState extends FoodCategoryState {
  final String error;

  const FoodCategoryErrorState(this.error);
}
