import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 180,
        width: 140,
        // child: SSNetworkImageWidget(
        //   imageUrl: widget.foodItem.imageUrl ?? "",
        // ),
      ),
    );
  }
}
