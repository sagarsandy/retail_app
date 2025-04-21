import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/ext/string_ext.dart';
import 'package:retail_app/core/presentation/widgets/ss_network_image_widget.dart';

import '../../../../../../app/theme/ss_colors.dart';
import '../../../../../../app/theme/ss_core_font.dart';

class ExploreTopCafesWidget extends StatelessWidget {
  const ExploreTopCafesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 12),
            child: Container(
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const SSNetworkImageWidget(
                          imageUrl:
                              "https://www.ghirne.com/wp-content/uploads/2024/11/thumb__700_0_0_0_auto.jpg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 8),
                    child: Text(
                      "Barbecue Nation Chicken Barbecue Nation Chicken"
                          .fitText(length: 34),
                      style: Theme.of(context).textTheme.medium(
                            SSColors.black,
                            fontWeight: FontWeightType.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 4),
                    child: Text(
                      "Pantakaluva road, near Nirman College, Vijayawada."
                          .fitText(length: 48),
                      style: Theme.of(context).textTheme.regular(
                            SSColors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 6.0, top: 2, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: SSColors.grey1,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "30-45 mins",
                              style: Theme.of(context).textTheme.regular(
                                    SSColors.black,
                                  ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.favorite_border_outlined,
                          color: SSColors.grey1,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: 10, // This can be dynamic
      ),
    );
  }
}
