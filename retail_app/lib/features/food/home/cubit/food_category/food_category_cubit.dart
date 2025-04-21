import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/food_category_use_case.dart';
import 'food_category_state.dart';

class FoodCategoryCubit extends Cubit<FoodCategoryState> {
  final FoodCategoryUseCase foodCategoryUseCase;
  FoodCategoryCubit(this.foodCategoryUseCase)
      : super(const FoodCategoryInitialState());

  void getFoodCategories() async {
    emit(const FoodCategoryLoadingState());
    try {
      final categories = await foodCategoryUseCase.getFoodCategories();
      emit(FoodCategoryLoadedState(categories: categories));
    } catch (e) {
      emit(FoodCategoryErrorState(e.toString()));
    }
  }
}
