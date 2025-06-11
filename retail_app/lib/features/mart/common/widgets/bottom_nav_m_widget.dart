import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/presentation/widgets/ss_bottm_nav_bar.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../app/router/ss_app_routes.dart';

class BottomNavMWidget extends StatefulWidget {
  final int activeIndex;
  const BottomNavMWidget({
    super.key,
    required this.activeIndex,
  });

  @override
  State<BottomNavMWidget> createState() => _BottomNavMWidgetState();
}

class _BottomNavMWidgetState extends State<BottomNavMWidget> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.add_shopping_cart_outlined,
    Icons.shopping_basket_outlined,
    Icons.menu_outlined,
  ];

  final List<String> _titles = [
    'Home',
    'Cart',
    'Orders',
    'Menu',
  ];

  final List<SSRouteInfo> _routes = [
    SSAppRoutes.martHome,
    SSAppRoutes.cafeCart,
    SSAppRoutes.cafeOrders,
    SSAppRoutes.cafeOptionsMenu,
  ];

  void _onItemTapped(int index) {
    debugPrint('click index=$index');
    final SSRouteInfo location = _routes[index];
    context.pushToPage(
      location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SSBottomNavBar(
        icons: _icons,
        titles: _titles,
        selectedIndex: widget.activeIndex,
        actionColor: SSColors.actionM,
        onItemTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
