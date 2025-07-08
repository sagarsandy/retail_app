import 'package:flutter/material.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/cart_order_summary_item_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class CartOrderSummaryWidget extends StatelessWidget {
  const CartOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
            CartOrderSummaryItemWidget(
              title: "Items Total:",
              price: "120",
              originalPrice: "150",
            ),
            const SizedBox(height: 4),
            CartOrderSummaryItemWidget(
              title: "Coupon Discount",
              price: "15",
            ),
            const SizedBox(height: 4),
            CartOrderSummaryItemWidget(
              title: "Delivery Charges",
              price: "10",
            ),
            const SizedBox(height: 4),
            CartOrderSummaryItemWidget(
              title: "Platform Charges",
              price: "5",
            ),
            const SizedBox(height: 16),
            CartOrderSummaryItemWidget(
              title: "Total",
              price: "120",
            ),
          ],
        ),
      ),
    );
  }
}
