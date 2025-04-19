import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/router/ss_app_routes.dart';
import '../../../../../app/theme/ss_colors.dart';
import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

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
          Center(
            child: GestureDetector(
              onTap: () {
                context.pushToPage(SSAppRoutes.foodDetails);
              },
              child: Text(
                'Home Page',
                style:
                    Theme.of(context).textTheme.extraLarge(SSColors.primary1),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavWidget(
              activeIndex: 0,
            ),
          ),
        ],
      ),
    );
  }
}
