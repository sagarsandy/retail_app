import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:retail_admin/app/router/ss_app_routes.dart';
import 'package:retail_admin/app/router/ss_route_utility.dart';
import 'package:retail_admin/core/constants/ss_dimensions.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class AdminSideBarMenuWidget extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback? onCloseSidebar;
  final ValueChanged<int>? onIndexChanged;

  const AdminSideBarMenuWidget({
    super.key,
    required this.selectedIndex,
    this.onCloseSidebar,
    this.onIndexChanged,
  });

  static const List<String> _titles = [
    'Dashboard',
    'Orders',
    'Coupons',
    'Details',
    'Categories',
    'Food Menu',
    'Reviews',
    'Revenue',
    'Settlements',
    'Logout'
  ];

  void _handleMenuSelection(BuildContext context, int index) {
    // Notify parent about index change
    onIndexChanged?.call(index);

    if (index == _titles.length - 1) {
      // Handle logout
      context.goNamed(SSAppRoutes.login.name);
      return;
    }

    // Handle navigation based on menu selection
    final route = _getRouteForIndex(index);
    context.goToPage(route);

    // Close drawer after selection
    Navigator.pop(context);
  }

  void _handleClose(BuildContext context) {
    // Close the drawer
    Navigator.pop(context);
    // Notify parent if callback is provided
    onCloseSidebar?.call();
  }

  SSRouteInfo _getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return SSAppRoutes.home;
      case 1:
        return SSAppRoutes.home;
      case 2:
        return SSAppRoutes.home;
      case 3:
        return SSAppRoutes.home;
      case 4:
        return SSAppRoutes.categories;
      case 5:
        return SSAppRoutes.foodItems;
      case 6:
        return SSAppRoutes.reviews;
      case 7:
        return SSAppRoutes.home;
      case 8:
        return SSAppRoutes.home;
      default:
        return SSAppRoutes.home;
    }
  }

  static String getTitleForIndex(int index) {
    if (index < 0 || index >= _titles.length) {
      return '';
    }
    return _titles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SSDimensions.drawerWidth,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: SSColors.white,
        boxShadow: [
          BoxShadow(
            color: SSColors.grey1.withOpacity(0.2),
            spreadRadius: SSDimensions.spacingXXS,
            blurRadius: SSDimensions.spacingXS,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            const Divider(height: SSDimensions.spacingXXS),
            Expanded(
              child: _buildMenuItems(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SSDimensions.spacingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Admin Panel',
            style: Theme.of(context).textTheme.extraLarge(
                  SSColors.black,
                  fontWeight: FontWeightType.extraBold,
                ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: SSColors.black),
            onPressed: () => _handleClose(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          _titles.length * 2 - 1,
          (index) {
            if (index.isOdd) {
              return const Divider(
                height: SSDimensions.spacingXXS,
                color: SSColors.grey1,
              );
            }

            final itemIndex = index ~/ 2;
            final bool isSelected = itemIndex == selectedIndex;
            final bool isLogout = itemIndex == _titles.length - 1;

            return Container(
              color: isSelected
                  ? SSColors.surface.withOpacity(0.1)
                  : SSColors.transparent,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.only(left: SSDimensions.spacingL),
                visualDensity: const VisualDensity(
                  horizontal: 0,
                  vertical: -1,
                ),
                title: Text(
                  _titles[itemIndex],
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.medium(
                        isLogout
                            ? SSColors.error1
                            : isSelected
                                ? SSColors.secondary1
                                : SSColors.black,
                        fontWeight: isSelected || isLogout
                            ? FontWeightType.extraBold
                            : FontWeightType.normal,
                      ),
                ),
                selected: isSelected,
                onTap: () => _handleMenuSelection(context, itemIndex),
              ),
            );
          },
        ),
      ),
    );
  }
}
