import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../global_menu/presentation/widgets/global_menu_widget.dart';
import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      body: const Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: GlobalMenuWidget(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavWidget(
              activeIndex: 4,
            ),
          ),
        ],
      ),
    );
  }
}
