import '../../domain/models/food_category.dart';

abstract class FoodCategoriesState {
  const FoodCategoriesState();
}

class FoodCategoriesInitialState extends FoodCategoriesState {
  const FoodCategoriesInitialState();
}

class FoodCategoriesLoadingState extends FoodCategoriesState {
  const FoodCategoriesLoadingState();
}

class FoodCategoriesSuccessState extends FoodCategoriesState {
  final List<FoodCategory> categories;
  final String? message;

  const FoodCategoriesSuccessState({
    required this.categories,
    this.message,
  });
}

class FoodCategoriesErrorState extends FoodCategoriesState {
  final String message;

  const FoodCategoriesErrorState(this.message);
}
