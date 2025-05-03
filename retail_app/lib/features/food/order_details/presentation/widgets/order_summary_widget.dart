import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/features/food/order_details/presentation/widgets/order_cafe_item_widget.dart';
import 'package:retail_app/features/food/order_details/presentation/widgets/order_charges_item_widget.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

import '../../../../../app/theme/ss_colors.dart';
import '../../../../../app/theme/ss_core_font.dart';

enum OrderTextStyleType {
  regular,
  medium,
  large,
}

class OrderSummaryWidget extends StatelessWidget {
  final CafeOrder order;
  const OrderSummaryWidget({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
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
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OrderCafeItemWidget(orderItem: order.items[index]);
              },
              itemCount: order.items.length,
            ),
            const SizedBox(height: 12),
            OrderChargesItemWidget(
              title: "Item(s) Total: ",
              value: "₹${order.totalPrice.toString()}",
              textStyleType: OrderTextStyleType.medium,
            ),
            const SizedBox(height: 6),
            OrderChargesItemWidget(
              title: "Discount",
              value: "₹${order.discount.toString()}",
              textStyleType: OrderTextStyleType.medium,
            ),
            OrderChargesItemWidget(
              title: "Delivery Charges",
              value: "₹${order.deliveryCharge.toString()}",
              textStyleType: OrderTextStyleType.regular,
            ),
            OrderChargesItemWidget(
              title: "Platform Charges",
              value: "₹${order.platformFee.toString()}",
              textStyleType: OrderTextStyleType.regular,
            ),
            OrderChargesItemWidget(
              title: "Taxes",
              value: "₹${order.tax.toString()}",
              textStyleType: OrderTextStyleType.regular,
            ),
            const SizedBox(height: 12),
            OrderChargesItemWidget(
              title: "Total Amount",
              value: "₹${order.totalPaid.toString()}",
              textStyleType: OrderTextStyleType.large,
            ),
            const SizedBox(height: 6),
            OrderChargesItemWidget(
              title: "Payment Mode",
              value: order.paymentMethod,
              textStyleType: OrderTextStyleType.medium,
            ),
          ],
        ),
      ),
    );
  }
}
