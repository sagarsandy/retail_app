import 'package:flutter/material.dart';
import 'package:retail_admin/features/food/food_items/domain/models/food_item.dart';
import 'package:retail_admin/features/food/manage_food_item/presentation/widgets/manage_food_item_form_widget.dart';

class ManageFoodItemPage extends StatelessWidget {
  final FoodItem? foodItem;

  const ManageFoodItemPage({
    super.key,
    this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem != null ? 'Edit Food Item' : 'Add Food Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ManageFoodItemFormWidget(foodItem: foodItem),
        ),
      ),
    );
  }
}
