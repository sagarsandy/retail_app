import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_admin/core/presentation/widgets/ss_alert_widget.dart';
import 'package:retail_admin/core/presentation/widgets/ss_toast.dart';

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

  void _handleEditItem(String itemId) {
    // TODO: Implement edit functionality
    debugPrint('Edit item: $itemId');
  }

  void _handleDeleteItem(BuildContext context, String itemId) {
    showDialog(
      context: context,
      builder: (context) => SSAlertWidget(
        title: 'Delete Food Item',
        description:
            'Are you sure you want to delete this food item? This action cannot be undone.',
        actionButtonTitle: 'Delete',
        onAction: () {
          foodItemsCubit.deleteFoodItem(itemId);
        },
      ),
    );
  }

  void _handleToggleAvailability(
      BuildContext context, String itemId, bool isAvailable) {
    if (isAvailable) {
      // If enabling the item, no need for confirmation
      foodItemsCubit.toggleFoodItemAvailability(itemId);
    } else {
      // If disabling the item, show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => SSAlertWidget(
          title: 'Food Item Unavailability',
          description:
              'Are you sure you want to make it unavailable? It will not be visible to customers.',
          actionButtonTitle: 'Unavailable',
          onAction: () {
            foodItemsCubit.toggleFoodItemAvailability(itemId);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodItemsCubit, FoodItemsState>(
      bloc: foodItemsCubit,
      builder: (context, state) {
        if (state is FoodItemsLoadingState) {
          return const FoodItemsLoadingWidget();
        }

        if (state is FoodItemsErrorState) {
          SSToast.error(context, state.message);
          return FoodItemsErrorWidget(
            message: state.message,
            onRetry: () => foodItemsCubit.getFoodItems(),
          );
        }

        if (state is FoodItemsSuccessState) {
          if (state.message != null) {
            SSToast.success(context, state.message!);
          }

          if (state.foodCategories.isEmpty) {
            return const FoodItemsEmptyWidget();
          }

          return FoodItemsListWidget(
            foodItemCategories: state.foodCategories,
            onEditItem: _handleEditItem,
            onDeleteItem: (itemId) => _handleDeleteItem(context, itemId),
            onToggleAvailability: (itemId, isAvailable) =>
                _handleToggleAvailability(context, itemId, isAvailable),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
