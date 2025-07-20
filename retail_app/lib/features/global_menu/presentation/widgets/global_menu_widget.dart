import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/features/global_menu/presentation/widgets/account_info_widget.dart';
import 'package:retail_app/features/global_menu/presentation/widgets/global_menu_item_widget.dart';

class GlobalMenuWidget extends StatefulWidget {
  const GlobalMenuWidget({super.key});

  @override
  State<GlobalMenuWidget> createState() => _GlobalMenuWidgetState();
}

class _GlobalMenuWidgetState extends State<GlobalMenuWidget> {
  final List<String> items = [
    "Address book",
    "Refer & Earn",
    "Support",
    "About us",
    "Logout",
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 80,
          ),
        ),
        const SliverToBoxAdapter(child: AccountInfoWidget()),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () {
                  _handleMenuItemTap(index);
                },
                child: GlobalMenuItemWidget(title: items[index]),
              );
            },
            childCount: items.length, // This can be dynamic
          ),
        ),
      ],
    );
  }

  void _handleMenuItemTap(int index) {
    switch (index) {
      case 0:
        context.pushToPage(SSAppRoutes.addressBook);
        break;
      case 1:
        context.pushToPage(SSAppRoutes.referAndEarn);
        break;
      case 2:
        context.pushToPage(SSAppRoutes.support);
        break;
      case 3:
        context.pushToPage(SSAppRoutes.aboutUs);
        break;
      case 4:
        // Handle logout logic here
        break;
    }
  }
}
