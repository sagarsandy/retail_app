import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/title_widget.dart';

import 'category_list_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 165,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: 'Choose your dish'),
            SizedBox(height: 8),
            Expanded(child: CategoryListWidget()),
          ],
        ),
      ),
    );
  }
}
