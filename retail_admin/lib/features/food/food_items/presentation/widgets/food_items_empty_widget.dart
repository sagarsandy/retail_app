import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FoodItemsEmptyWidget extends StatelessWidget {
  const FoodItemsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Food Items',
            style: Theme.of(context).textTheme.large(
                  SSColors.black,
                  fontWeight: FontWeightType.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first food item by clicking the + button',
            style: Theme.of(context).textTheme.medium(
                  SSColors.grey1,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
