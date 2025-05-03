import 'package:flutter/material.dart';
import 'package:retail_app/core/presentation/widgets/ss_app_bar_widget.dart';
import 'package:retail_app/core/presentation/widgets/ss_link_text_widget.dart';
import 'package:retail_app/features/food/order_details/presentation/widgets/order_info_widget.dart';
import 'package:retail_app/features/food/order_details/presentation/widgets/order_summary_widget.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

class OrderDetailsPage extends StatefulWidget {
  final CafeOrder? order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SSAppBarWidget(
        showTitle: true,
        title: "Order Details",
        trailingWidget: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: SSLinkTextWidget(text: "Help", onTap: () {}),
        ),
      ),
      body: Visibility(
        visible: widget.order != null,
        replacement: const Center(
          child: Text(
            "Something went wrong. Please try again later.",
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OrderInfoWidget(order: widget.order!),
                const SizedBox(height: 24),
                OrderSummaryWidget(order: widget.order!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
