import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/core/ext/string_ext.dart';
import 'package:retail_app/features/food/common/model/cafe.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';
import 'package:retail_core/widgets/ss_network_image_widget.dart';

import '../../../../common/utils/widget_utils/favourite_icon_widget.dart';

class ExploreCafeListItemWidget extends StatelessWidget {
  final Cafe cafe;
  const ExploreCafeListItemWidget({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushToPage(
          SSAppRoutes.cafeDetails,
          extra: {
            "cafe": cafe,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 12),
        child: Container(
          height: 255,
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
                  child: SSNetworkImageWidget(imageUrl: cafe.imageUrl ?? ""),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, top: 8),
                        child: Text(
                          cafe.name.fitText(length: 34),
                          style: Theme.of(context).textTheme.medium(
                                SSColors.black,
                                fontWeight: FontWeightType.bold,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, top: 4),
                        child: Text(
                          cafe.address.fitText(length: 48),
                          style: Theme.of(context).textTheme.regular(
                                SSColors.black,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 6.0, top: 2, right: 12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time_outlined,
                              color: SSColors.grey1,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              cafe.deliveryTime,
                              style: Theme.of(context).textTheme.regular(
                                    SSColors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FavouriteIconWidget(
                    key: ValueKey(cafe.id.toString()),
                    cafe: cafe,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
