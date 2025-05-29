import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/enums/food_type.dart';
import '../../domain/models/food_item.dart';
import '../../domain/models/food_item_category.dart';
import '../../domain/use_case/food_items_use_case.dart';
import 'food_items_state.dart';

class FoodItemsCubit extends Cubit<FoodItemsState> {
  final FoodItemsUseCase useCase;

  FoodItemsCubit(this.useCase) : super(const FoodItemsInitialState());

  Future<void> getFoodItems() async {
    try {
      emit(const FoodItemsLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      final categories = await useCase.getFoodItems();
      emit(FoodItemsSuccessState(foodCategories: categories));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to fetch food items: $e'));
    }
  }

  Future<void> filterFoodItems(String filterType) async {
    try {
      emit(const FoodItemsLoadingState());
      await Future.delayed(const Duration(milliseconds: 500));

      final type = FoodType.values.firstWhere(
        (type) => type.title == filterType,
        orElse: () => FoodType.all,
      );

      final categories = await useCase.getFoodItemsByType(type);
      emit(FoodItemsSuccessState(foodCategories: categories));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to filter food items: $e'));
    }
  }

  Future<void> getFoodItemsByCategory(String categoryId) async {
    try {
      emit(const FoodItemsLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      final items = await useCase.getFoodItemsByCategory(categoryId);
      final category = FoodItemCategory(name: categoryId, foodItems: items);
      emit(FoodItemsSuccessState(foodCategories: [category]));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to fetch food items: $e'));
    }
  }

  Future<void> addFoodItem(FoodItem item) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await useCase.addFoodItem(item);

      final categories = await useCase.getFoodItems();
      emit(FoodItemsSuccessState(
        foodCategories: categories,
        message: 'Food item added successfully',
      ));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to add food item: $e'));
    }
  }

  Future<void> updateFoodItem(FoodItem item) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await useCase.updateFoodItem(item);

      final categories = await useCase.getFoodItems();
      emit(FoodItemsSuccessState(
        foodCategories: categories,
        message: 'Food item updated successfully',
      ));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to update food item: $e'));
    }
  }

  Future<void> deleteFoodItem(String id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await useCase.deleteFoodItem(id);

      final categories = await useCase.getFoodItems();
      emit(FoodItemsSuccessState(
        foodCategories: categories,
        message: 'Food item deleted successfully',
      ));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to delete food item: $e'));
    }
  }

  Future<void> toggleFoodItemAvailability(String id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await useCase.toggleFoodItemAvailability(id);

      final categories = await useCase.getFoodItems();
      emit(FoodItemsSuccessState(
        foodCategories: categories,
        message: 'Food item availability updated',
      ));
    } catch (e) {
      emit(FoodItemsErrorState('Failed to update food item availability: $e'));
    }
  }
}
