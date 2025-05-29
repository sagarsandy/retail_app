import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class FoodCategoriesAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onAddPressed;

  const FoodCategoriesAppBarWidget({
    super.key,
    this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: SSColors.white,
      title: Text(
        'Food Categories',
        style: Theme.of(context).textTheme.large(
              SSColors.black,
              fontWeight: FontWeightType.extraBold,
            ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add, color: SSColors.black),
          onPressed: onAddPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
