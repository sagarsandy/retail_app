import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../app/router/ss_app_routes.dart';
import 'order_list_item_details_widget.dart';

class OrdersListItemWidget extends StatelessWidget {
  const OrdersListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushToPage(SSAppRoutes.martOrderDetails, extra: {
          'martOrder': "martOrder",
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: SSColors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OrderListItemDetailsWidget(
                            title: 'Delivered on: ',
                            value: '12/03/2025 12:30AM',
                          ),
                          SizedBox(height: 4),
                          OrderListItemDetailsWidget(
                            title: 'Total Item(s):',
                            value: '3',
                          ),
                          SizedBox(height: 4),
                          OrderListItemDetailsWidget(
                            title: 'Order Value: ',
                            value: '\$120.00',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.chevron_right,
                      size: 40,
                      color: SSColors.actionM,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
