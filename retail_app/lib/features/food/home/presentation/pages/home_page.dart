import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/explore_top_cafe/explore_top_cafes_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/offers_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/title_widget.dart';

import '../../../common/utils/widget_utils/bottom_nav_widget.dart';
import '../widgets/food_category/food_category_widget.dart';
import '../widgets/header/home_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> offers = [
    "Offer 1",
    "Offer 2",
    "Offer 3",
    "Offer 4",
    "Offer 5"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomScrollView(
              slivers: [
                const HomeHeaderWidget(),
                OffersWidget(offers: offers),
                const RecommendedWidget(),
                const FoodCategoryWidget(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                    child: TitleWidget(title: "Trending Cafes"),
                  ),
                ),
                const ExploreTopCafesWidget(),
              ],
            ),
          ),
          const BottomNavWidget(activeIndex: 0),
        ],
      ),
    );
  }
}
