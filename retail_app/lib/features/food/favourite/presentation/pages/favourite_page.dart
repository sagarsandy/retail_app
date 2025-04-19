import 'package:flutter/material.dart';

import '../../../common/utils/widget_utils/bottom_nav_widget.dart';
import '../../../common/utils/widget_utils/trail_widget.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: TrailWidget(
              title: 'Favourite Page',
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavWidget(
              activeIndex: 1,
            ),
          ),
        ],
      ),
    );
  }
}
