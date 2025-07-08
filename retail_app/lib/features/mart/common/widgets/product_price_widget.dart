import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class ProductPriceWidget extends StatelessWidget {
  final String price;
  final String? originalPrice;
  const ProductPriceWidget({
    super.key,
    required this.price,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 4),
        Visibility(
          visible: originalPrice != null,
          child: Text(
            "₹$originalPrice",
            style: Theme.of(context).textTheme.small(
                  SSColors.black,
                  isStrikeThrough: true,
                ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          "₹$price",
          style: Theme.of(context).textTheme.medium(
                SSColors.black,
                fontWeight: FontWeightType.bold,
              ),
        ),
      ],
    );
  }
}
