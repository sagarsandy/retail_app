import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';

class FoodItemsLoadingWidget extends StatelessWidget {
  const FoodItemsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(SSColors.action),
      ),
    );
  }
}
