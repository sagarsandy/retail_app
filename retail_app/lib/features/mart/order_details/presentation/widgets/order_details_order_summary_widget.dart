import 'package:flutter/material.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

import 'order_details_order_summary_item_widget.dart';

class OrderDetailsOrderSummaryWidget extends StatelessWidget {
  const OrderDetailsOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Summary",
              style: Theme.of(context).textTheme.large(
                    SSColors.black,
                    fontWeight: FontWeightType.bold,
                  ),
            ),
            const SizedBox(height: 12),
            const OrderDetailsOrderSummaryItemWidget(
              title: "Items Total:",
              price: "120",
              originalPrice: "150",
            ),
            const SizedBox(height: 4),
            const OrderDetailsOrderSummaryItemWidget(
              title: "Coupon Discount",
              price: "15",
            ),
            const SizedBox(height: 4),
            const OrderDetailsOrderSummaryItemWidget(
              title: "Delivery Charges",
              price: "10",
            ),
            const SizedBox(height: 4),
            const OrderDetailsOrderSummaryItemWidget(
              title: "Platform Charges",
              price: "5",
            ),
            const SizedBox(height: 16),
            const OrderDetailsOrderSummaryItemWidget(
              title: "Total",
              price: "120",
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Payment Mode",
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    "UPI",
                    style: Theme.of(context).textTheme.medium(
                          SSColors.black,
                          fontWeight: FontWeightType.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
