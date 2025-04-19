import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/presentation/widgets/ss_bottm_nav_bar.dart';

import '../../../../../app/router/ss_app_routes.dart';

class BottomNavWidget extends StatefulWidget {
  final int activeIndex;
  const BottomNavWidget({
    super.key,
    required this.activeIndex,
  });

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.favorite_border_outlined,
    Icons.add_shopping_cart_outlined,
    Icons.shopping_basket_outlined,
    Icons.menu_outlined,
  ];

  final List<String> _titles = [
    'Home',
    'Favourite',
    'Cart',
    'Orders',
    'Menu',
  ];

  final List<SSRouteInfo> _routes = [
    SSAppRoutes.foodHome,
    SSAppRoutes.foodFavourite,
    SSAppRoutes.foodCart,
    SSAppRoutes.foodOrders,
    SSAppRoutes.foodMenu,
  ];

  void _onItemTapped(int index) {
    debugPrint('click index=$index');
    final SSRouteInfo location = _routes[index];
    context.goToPage(
      location,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SSBottomNavBar(
      icons: _icons,
      titles: _titles,
      selectedIndex: widget.activeIndex,
      onItemTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}
