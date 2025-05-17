import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/string_ext.dart';
import 'package:retail_app/features/food/common/model/food_category.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/utils/ss_image_provider.dart';

class FoodCategoryItemWidget extends StatelessWidget {
  final FoodCategory foodCategory;
  const FoodCategoryItemWidget({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 6.0),
      child: Column(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: SSImageProvider.getImage(foodCategory.imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: const Offset(2, 5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            foodCategory.name.fitText(length: 11),
            style: Theme.of(context).textTheme.regular(SSColors.black),
          ),
        ],
      ),
    );
  }
}
