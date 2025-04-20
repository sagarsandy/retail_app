import 'package:flutter/material.dart';
import 'package:retail_app/features/food/home/presentation/widgets/offers_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/recommended/recommended_widget.dart';

import '../../../common/utils/widget_utils/bottom_nav_widget.dart';
import '../widgets/header/home_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                const OffersWidget(offers: [
                  "Offer 1",
                  "Offer 2",
                  "Offer 3",
                  "Offer 4",
                  "Offer 5"
                ]),
                const RecommendedWidget(),
                SliverToBoxAdapter(
                  child: Container(height: 100, color: Colors.blue),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: Text('Item ${index + 1}'),
                      );
                    },
                    childCount: 10, // This can be dynamic
                  ),
                ),
              ],
            ),
          ),
          const BottomNavWidget(activeIndex: 0),
        ],
      ),
    );
  }
}
