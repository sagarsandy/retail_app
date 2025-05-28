import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

class FoodCategoriesEmptyStateWidget extends StatelessWidget {
  final VoidCallback onAddCategory;

  const FoodCategoriesEmptyStateWidget({
    super.key,
    required this.onAddCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category_outlined,
              size: 64, color: SSColors.grey1.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            'No categories found',
            style: Theme.of(context).textTheme.large(
                  SSColors.grey1,
                  fontWeight: FontWeightType.normal,
                ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 150,
            child: SSButtonWidget(
              elevation: 0,
              title: 'Add Category',
              onTap: onAddCategory,
            ),
          ),
        ],
      ),
    );
  }
}
