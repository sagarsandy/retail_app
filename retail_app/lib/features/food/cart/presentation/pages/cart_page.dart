import 'package:flutter/material.dart';
import 'package:retail_app/features/food/common/utils/widget_utils/trail_widget.dart';

import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: TrailWidget(
              title: 'Cart Page',
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavWidget(
              activeIndex: 2,
            ),
          ),
        ],
      ),
    );
  }
}
