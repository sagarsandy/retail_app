import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FoodItemInfoWidget extends StatelessWidget {
  final FoodItem foodItem;
  const FoodItemInfoWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 140,
        child: Padding(
          padding: EdgeInsets.only(
            left: SSDimensions.spacingS + 2,
            top: SSDimensions.spacingXS,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.square,
                size: SSDimensions.iconSizeM,
                color: foodItem.isVeg
                    ? Colors.green
                    : foodItem.isNonVeg
                        ? Colors.red
                        : Colors.yellow,
              ),
              const SizedBox(height: SSDimensions.spacingS),
              Text(
                foodItem.name,
                maxLines: 2,
                style: Theme.of(context).textTheme.medium(
                      SSColors.black3,
                    ),
              ),
              const SizedBox(height: SSDimensions.spacingS),
              Row(
                children: [
                  Visibility(
                    visible: foodItem.originalPrice != null,
                    child: Text(
                      "₹${foodItem.originalPrice}",
                      style: Theme.of(context).textTheme.medium(
                            SSColors.black,
                            isStrikeThrough: true,
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "₹${foodItem.price}",
                    style: Theme.of(context).textTheme.extraLarge(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
