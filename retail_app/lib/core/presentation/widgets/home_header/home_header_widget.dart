import 'package:flutter/material.dart';
import 'package:retail_app/core/enums/app_enum.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_switch_widget.dart';
import 'package:retail_app/core/util/app_util.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import 'header_search_box_widget.dart';
import 'location_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SizedBox(
          height: 205,
          child: Padding(
            padding: const EdgeInsets.only(top: 46),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        " ${AppUtil().appType == AppType.food ? 'Food' : 'Grocery'}",
                        style: Theme.of(context).textTheme.custom(
                              AppUtil().appType == AppType.food
                                  ? SSColors.actionF
                                  : SSColors.actionM,
                              fontSize: 22,
                              fontWeight: FontWeightType.bold,
                            ),
                      ),
                    ),
                    SSAppSwitchWidget(
                      appType: AppUtil().appType,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LocationWidget(
                  appType: AppUtil().appType,
                ),
                HeaderSearchBoxWidget(
                  appType: AppUtil().appType,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
