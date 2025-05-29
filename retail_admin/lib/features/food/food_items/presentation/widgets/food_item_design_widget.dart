import 'package:flutter/material.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';

import '../../domain/models/food_item.dart';

class FoodItemDesignWidget extends StatefulWidget {
  final FoodItem foodItem;
  const FoodItemDesignWidget({super.key, required this.foodItem});

  @override
  State<FoodItemDesignWidget> createState() => _FoodItemDesignWidgetState();
}

class _FoodItemDesignWidgetState extends State<FoodItemDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SSDimensions.borderRadiusM),
      child: SizedBox(
        height: 140,
        width: 140,
        // child: SSNetworkImageWidget(
        //   imageUrl: widget.foodItem.imageUrl ?? "",
        // ),
      ),
    );
  }
}
