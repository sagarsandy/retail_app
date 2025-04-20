import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_list_item_widget.dart';

class RecommendedListWidget extends StatelessWidget {
  const RecommendedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const RecommendedListItemWidget();
      },
    );
  }
}
