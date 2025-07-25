import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_offers_widget.dart';
import 'package:retail_app/features/mart/common/widgets/bottom_nav_m_widget.dart';
import 'package:retail_app/features/mart/home/presentation/widgets/primary_categories_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../core/presentation/widgets/home_header/home_header_widget.dart';

class HomePageM extends StatefulWidget {
  const HomePageM({super.key});

  @override
  State<HomePageM> createState() => _HomePageMState();
}

class _HomePageMState extends State<HomePageM> {
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
      backgroundColor: SSColors.transparent.surface(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CustomScrollView(
              slivers: [
                const HomeHeaderWidget(),
                OffersWidget(offers: offers),
                const PrimaryCategoriesWidget(),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 120), // Spacer
                ),
              ],
            ),
          ),
          const BottomNavMWidget(activeIndex: 0),
        ],
      ),
    );
  }
}
