import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_list_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_title_widget.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.0),
        child: SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecommendedTitleWidget(),
              SizedBox(height: 10),
              Expanded(child: RecommendedListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
