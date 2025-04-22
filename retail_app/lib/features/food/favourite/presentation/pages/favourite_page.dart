import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_app/features/food/favourite/presentation/widgets/favourite_list_widget.dart';

import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SSAppBarWidget(showTitle: true, title: "Favourites"),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 6,
            ), // leave space for nav bar
            child: CustomScrollView(
              slivers: [
                FavouriteListWidget(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 65),
                )
              ],
            ),
          ),
          BottomNavWidget(activeIndex: 1),
        ],
      ),
    );
  }
}
