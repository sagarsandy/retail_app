import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../../app/theme/ss_colors.dart';

class ItemInfoWidget extends StatelessWidget {
  const ItemInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.square,
                size: 24,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              Text(
                "Chicken Biryani, i will be cooking it soon!. Let's wait for my signal",
                maxLines: 2,
                style: Theme.of(context).textTheme.medium(
                      SSColors.black3,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "₹200",
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black,
                          isStrikeThrough: true,
                        ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "₹199",
                    style: Theme.of(context).textTheme.extraLarge(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
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
