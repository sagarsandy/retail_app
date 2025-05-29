import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FoodItemsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const FoodItemsAppBarWidget({super.key});

  void _handleAddPressed(BuildContext context) {
    // TODO: Navigate to add food item page
    // Example:
    // Navigator.pushNamed(context, '/add-food-item');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: SSColors.white,
      title: Text(
        'Food Items',
        style: Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.extraBold,
            ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: SSColors.black),
          onPressed: () => _handleAddPressed(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
