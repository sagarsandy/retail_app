import 'package:flutter/material.dart';
import 'package:retail_app/features/food/cafe_details/domain/models/cafe_details.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class CafeInfoWidget extends StatelessWidget {
  final CafeDetails cafeDetails;

  const CafeInfoWidget({super.key, required this.cafeDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            cafeDetails.name,
            style: Theme.of(context).textTheme.custom(
                  SSColors.black,
                  fontSize: 22,
                  fontWeight: FontWeightType.extraBold,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cafeDetails.address,
                style: Theme.of(context).textTheme.regular(
                      SSColors.black2,
                    ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    size: 16,
                    color: SSColors.grey1,
                  ),
                  Text(
                    cafeDetails.deliveryTime,
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black2,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Open: ${cafeDetails.openTime} - Close: ${cafeDetails.closeTime}",
            style: Theme.of(context).textTheme.regular(
                  SSColors.black2,
                ),
          ),
        ],
      ),
    );
  }
}
