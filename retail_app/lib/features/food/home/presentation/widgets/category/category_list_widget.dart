import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/category/category_item_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (context, index) {
        return const CategoryItemWidget();
      },
    );
  }
}
