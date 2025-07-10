import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import '../../../common/widgets/product_price_widget.dart';

class OrderDetailsOrderSummaryItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String? originalPrice;
  const OrderDetailsOrderSummaryItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.medium(
                  SSColors.black,
                ),
          ),
          const Spacer(),
          ProductPriceWidget(
            price: price,
            originalPrice: originalPrice,
          ),
        ],
      ),
    );
  }
}
