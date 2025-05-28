import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_admin/features/food/food_categories/domain/use_case/food_category_use_case.dart';

import '../../domain/models/food_category.dart';
import 'food_categories_state.dart';

class FoodCategoriesCubit extends Cubit<FoodCategoriesState> {
  final FoodCategoryUseCase useCase;
  // In-memory storage for demo purposes
  final List<FoodCategory> _foodCategories = [];

  FoodCategoriesCubit(this.useCase) : super(const FoodCategoriesInitialState());

  Future<void> getFoodCategories() async {
    try {
      emit(const FoodCategoriesLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      emit(FoodCategoriesSuccessState(categories: List.from(_foodCategories)));
    } catch (e) {
      emit(FoodCategoriesErrorState('Failed to fetch categories: $e'));
    }
  }

  Future<void> addFoodCategory(FoodCategory category) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      _foodCategories.add(category);

      emit(FoodCategoriesSuccessState(
        categories: List.from(_foodCategories),
        message: 'Category added successfully',
      ));
    } catch (e) {
      emit(FoodCategoriesErrorState('Failed to add category: $e'));
    }
  }

  Future<void> updateFoodCategory(FoodCategory category) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final index = _foodCategories.indexWhere((c) => c.id == category.id);
      if (index != -1) {
        _foodCategories[index] = category;
        emit(FoodCategoriesSuccessState(
          categories: List.from(_foodCategories),
          message: 'Category updated successfully',
        ));
      } else {
        emit(const FoodCategoriesErrorState('Category not found'));
      }
    } catch (e) {
      emit(FoodCategoriesErrorState('Failed to update category: $e'));
    }
  }

  Future<void> deleteFoodCategory(String id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      _foodCategories.removeWhere((category) => category.id == id);

      emit(FoodCategoriesSuccessState(
        categories: List.from(_foodCategories),
        message: 'Category deleted successfully',
      ));
    } catch (e) {
      emit(FoodCategoriesErrorState('Failed to delete category: $e'));
    }
  }
}
