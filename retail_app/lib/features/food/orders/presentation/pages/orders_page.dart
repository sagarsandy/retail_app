import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Orders Page',
              style: Theme.of(context).textTheme.extraLarge(SSColors.primary1),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavWidget(
              activeIndex: 3,
            ),
          ),
        ],
      ),
    );
  }
}
