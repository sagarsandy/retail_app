import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_switch_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/header/header_search_box_widget.dart';
import 'package:retail_app/features/food/home/presentation/widgets/header/location_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0),
        child: SizedBox(
          height: 175,
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: LocationWidget(),
                          ),
                          SSAppSwitchWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
                HeaderSearchBoxWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
