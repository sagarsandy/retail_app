import '../../domain/models/food_item_category.dart';

abstract class FoodItemsState {
  const FoodItemsState();
}

class FoodItemsInitialState extends FoodItemsState {
  const FoodItemsInitialState();
}

class FoodItemsLoadingState extends FoodItemsState {
  const FoodItemsLoadingState();
}

class FoodItemsSuccessState extends FoodItemsState {
  final List<FoodItemCategory> foodCategories;
  final String? message;

  const FoodItemsSuccessState({
    required this.foodCategories,
    this.message,
  });
}

class FoodItemsErrorState extends FoodItemsState {
  final String message;

  const FoodItemsErrorState(this.message);
}
