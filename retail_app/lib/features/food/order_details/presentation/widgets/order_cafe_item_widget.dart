import 'package:flutter/material.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

import '../../../../../app/theme/ss_colors.dart';

class OrderCafeItemWidget extends StatelessWidget {
  final CafeOrderItem orderItem;
  const OrderCafeItemWidget({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${orderItem.quantity} x ${orderItem.itemName}",
          style: Theme.of(context).textTheme.regular(
                SSColors.black,
              ),
        ),
        Text(
          "₹${orderItem.itemPrice}",
          style: Theme.of(context).textTheme.regular(
                SSColors.black,
              ),
        ),
      ],
    );
  }
}
