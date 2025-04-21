import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_app_routes.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/ext/string_ext.dart';

import '../../../../../../app/theme/ss_colors.dart';
import '../../../../../../app/theme/ss_core_font.dart';
import '../../../../common/model/cafe.dart';

class RecommendedListItemWidget extends StatelessWidget {
  final Cafe cafe;
  const RecommendedListItemWidget({super.key, required this.cafe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushToPage(
          SSAppRoutes.cafeDetails,
          extra: {'cafe': cafe},
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          padding: const EdgeInsets.all(1.5),
          width: 190,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: SSColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 190,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      cafe.imageUrl ?? "",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  cafe.name.fitText(length: 18),
                  style: Theme.of(context).textTheme.medium(
                        SSColors.black,
                        fontWeight: FontWeightType.bold,
                      ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cafe.category.fitText(length: 14),
                      style: Theme.of(context).textTheme.regular(
                            SSColors.black,
                          ),
                    ),
                    Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
