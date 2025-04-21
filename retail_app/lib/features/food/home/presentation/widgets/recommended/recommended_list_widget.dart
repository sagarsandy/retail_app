import 'package:flutter/material.dart';
import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_list_item_widget.dart';

class RecommendedListWidget extends StatelessWidget {
  final List<Cafe> cafes;
  const RecommendedListWidget({super.key, required this.cafes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cafes.length,
      itemBuilder: (context, index) {
        return RecommendedListItemWidget(cafe: cafes[index]);
      },
    );
  }
}
