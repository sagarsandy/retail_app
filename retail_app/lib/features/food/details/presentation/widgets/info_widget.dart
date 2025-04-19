import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../app/theme/ss_core_font.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String location;
  final String deliveryTime;
  final String openTime;
  final String closeTime;

  const InfoWidget({
    super.key,
    required this.title,
    required this.location,
    required this.deliveryTime,
    required this.openTime,
    required this.closeTime,
  });

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
            title,
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
                location,
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
                    deliveryTime,
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
            "Open: $openTime - Close: $closeTime",
            style: Theme.of(context).textTheme.regular(
                  SSColors.black2,
                ),
          ),
        ],
      ),
    );
  }
}
