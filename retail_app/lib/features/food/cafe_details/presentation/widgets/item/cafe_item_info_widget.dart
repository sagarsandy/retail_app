import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_core_font.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';

import '../../../../../../app/theme/ss_colors.dart';
import '../../../domain/models/cafe_details.dart';

class CafeItemInfoWidget extends StatelessWidget {
  final CafeItem cafeItem;
  const CafeItemInfoWidget({super.key, required this.cafeItem});

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
              Icon(
                Icons.square,
                size: 24,
                color: cafeItem.isVeg!
                    ? Colors.green
                    : cafeItem.isNonVeg!
                        ? Colors.red
                        : Colors.yellow,
              ),
              const SizedBox(height: 8),
              Text(
                cafeItem.name,
                maxLines: 2,
                style: Theme.of(context).textTheme.medium(
                      SSColors.black3,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "₹${cafeItem.originalPrice}",
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black,
                          isStrikeThrough: true,
                        ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "₹${cafeItem.price}",
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
