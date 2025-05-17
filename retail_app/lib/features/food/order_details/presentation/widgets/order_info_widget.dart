import 'package:flutter/material.dart';
import 'package:retail_app/features/food/order_details/presentation/widgets/order_info_item_widget.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';
import 'package:retail_core/theme/ss_theme_ext.dart';

class OrderInfoWidget extends StatelessWidget {
  final CafeOrder order;
  const OrderInfoWidget({super.key, required this.order});

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
              "Order No: #${order.orderId}",
              style: Theme.of(context).textTheme.medium(
                    Colors.grey,
                  ),
            ),
            const SizedBox(height: 12),
            OrderInfoItemWidget(
              title: order.cafeName,
              subtitle: order.cafeAddress,
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 12),
            OrderInfoItemWidget(
              title: "Delivered At",
              subtitle: order.deliveryAddress,
              icon: Icons.home_outlined,
            ),
            const SizedBox(height: 12),
            OrderInfoItemWidget(
              title: "Delivered On",
              subtitle: order.orderDate.toString(),
              icon: Icons.check,
            ),
          ],
        ),
      ),
    );
  }
}
