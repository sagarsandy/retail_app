import 'package:flutter/material.dart';
import 'package:retail_app/features/food/common/model/food_category.dart';
import 'package:retail_app/features/food/home/presentation/widgets/food_category/food_category_item_widget.dart';

class FoodCategoryListWidget extends StatelessWidget {
  final List<FoodCategory> foodCategories;
  const FoodCategoryListWidget({super.key, required this.foodCategories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: foodCategories.length,
      itemBuilder: (context, index) {
        return FoodCategoryItemWidget(foodCategory: foodCategories[index]);
      },
    );
  }
}
