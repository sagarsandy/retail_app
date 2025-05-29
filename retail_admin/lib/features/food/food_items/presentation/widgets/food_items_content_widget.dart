import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/food_items_cubit.dart';
import '../cubit/food_items_state.dart';
import 'food_items_empty_widget.dart';
import 'food_items_error_widget.dart';
import 'food_items_list_widget.dart';
import 'food_items_loading_widget.dart';

class FoodItemsContentWidget extends StatelessWidget {
  final FoodItemsCubit foodItemsCubit;

  const FoodItemsContentWidget({
    super.key,
    required this.foodItemsCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodItemsCubit, FoodItemsState>(
      bloc: foodItemsCubit,
      builder: (context, state) {
        if (state is FoodItemsLoadingState) {
          return const FoodItemsLoadingWidget();
        }

        if (state is FoodItemsErrorState) {
          return FoodItemsErrorWidget(
            message: state.message,
            onRetry: () => foodItemsCubit.getFoodItems(),
          );
        }

        if (state is FoodItemsSuccessState) {
          if (state.foodCategories.isEmpty) {
            return const FoodItemsEmptyWidget();
          }

          return FoodItemsListWidget(
            foodItemCategories: state.foodCategories,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
