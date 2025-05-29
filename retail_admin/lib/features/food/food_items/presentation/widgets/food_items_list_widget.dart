import 'package:flutter/material.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item_category.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/food_item_design_widget.dart';
import 'package:retail_admin/features/food/food_items/presentation/widgets/food_item_info_widget.dart';

import '../../../common/widgets/ss_expansion_tile_widget.dart';

class FoodItemsListWidget extends StatelessWidget {
  final List<FoodItemCategory> foodItemCategories;
  const FoodItemsListWidget({super.key, required this.foodItemCategories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: foodItemCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16),
        itemBuilder: (context, catIndex) {
          if (foodItemCategories[catIndex].foodItems == null ||
              foodItemCategories[catIndex].foodItems!.isEmpty) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SSExpansionTileWidget(
              title:
                  "${foodItemCategories[catIndex].name} (${foodItemCategories[catIndex].foodItems?.length})",
              children: [
                const SizedBox(height: 1),
                ListView.builder(
                  itemCount:
                      foodItemCategories[catIndex].foodItems?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cafeItem =
                        foodItemCategories[catIndex].foodItems![index];
                    return Container(
                      height: 140,
                      margin: const EdgeInsets.only(bottom: 8.0, right: 4.0),
                      child: Row(
                        children: [
                          FoodItemInfoWidget(foodItem: cafeItem),
                          const SizedBox(width: 8),
                          FoodItemDesignWidget(foodItem: cafeItem),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 1),
              ],
            ),
          );
        });
  }
}
