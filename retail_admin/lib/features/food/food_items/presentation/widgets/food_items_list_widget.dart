import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_admin/core/presentation/widgets/ss_dashed_divider.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item_category.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/food_item_design_widget.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/food_item_info_widget.dart';

import '../../../common/widgets/ss_expansion_tile_widget.dart';

class FoodItemsListWidget extends StatelessWidget {
  final List<FoodItemCategory> foodItemCategories;
  final Function(String)? onDeleteItem;
  final Function(String, bool)? onToggleAvailability;

  const FoodItemsListWidget({
    super.key,
    required this.foodItemCategories,
    this.onDeleteItem,
    this.onToggleAvailability,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: foodItemCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: SSDimensions.spacingM),
        itemBuilder: (context, catIndex) {
          if (foodItemCategories[catIndex].foodItems == null ||
              foodItemCategories[catIndex].foodItems!.isEmpty) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: SSDimensions.borderRadiusM),
            child: SSExpansionTileWidget(
              title:
                  "${foodItemCategories[catIndex].name} (${foodItemCategories[catIndex].foodItems?.length})",
              children: [
                const SizedBox(height: SSDimensions.spacingXXS),
                ListView.builder(
                  itemCount:
                      foodItemCategories[catIndex].foodItems?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cafeItem =
                        foodItemCategories[catIndex].foodItems![index];
                    return Column(
                      children: [
                        Container(
                          height: 140,
                          margin: const EdgeInsets.only(
                            right: SSDimensions.spacingXS,
                          ),
                          child: Row(
                            children: [
                              FoodItemInfoWidget(
                                foodItem: cafeItem,
                                onDelete: onDeleteItem != null
                                    ? () => onDeleteItem!(cafeItem.id)
                                    : null,
                                onAvailabilityChanged:
                                    onToggleAvailability != null
                                        ? (value) => onToggleAvailability!(
                                            cafeItem.id, value)
                                        : null,
                              ),
                              const SizedBox(width: SSDimensions.spacingS),
                              FoodItemDesignWidget(foodItem: cafeItem),
                            ],
                          ),
                        ),
                        if (index <
                            foodItemCategories[catIndex].foodItems!.length - 1)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: SSDimensions.spacingS,
                            ),
                            child: SSDashedDivider(
                              dashWidth: 8,
                              gap: 4,
                              height: 0.7,
                              strokeWidth: 1,
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: SSDimensions.spacingXXS),
              ],
            ),
          );
        });
  }
}
