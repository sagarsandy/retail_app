import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FoodItemInfoWidget extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final ValueChanged<bool>? onAvailabilityChanged;

  const FoodItemInfoWidget({
    super.key,
    required this.foodItem,
    this.onEdit,
    this.onDelete,
    this.onAvailabilityChanged,
  });

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
              // Price row
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
                  const SizedBox(width: SSDimensions.spacingM),
                  Text(
                    "₹${foodItem.price}",
                    style: Theme.of(context).textTheme.extraLarge(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              // Action buttons row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit,
                      color: SSColors.grey1,
                      size: SSDimensions.iconSizeM,
                    ),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: SSDimensions.spacingS),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: SSColors.grey1,
                      size: SSDimensions.iconSizeM,
                    ),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: SSDimensions.spacingS),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: foodItem.isAvailable ?? false,
                      onChanged: onAvailabilityChanged,
                      activeColor: SSColors.grey1,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SSDimensions.spacingXS),
            ],
          ),
        ),
      ),
    );
  }
}
