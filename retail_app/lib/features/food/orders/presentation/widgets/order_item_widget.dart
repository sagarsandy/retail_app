import 'package:flutter/material.dart';
import 'package:retail_app/app/router/ss_route_utility.dart';
import 'package:retail_app/app/theme/ss_theme_ext.dart';
import 'package:retail_app/core/ext/string_ext.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

import '../../../../../app/router/ss_app_routes.dart';
import '../../../../../app/theme/ss_colors.dart';
import '../../../../../app/theme/ss_core_font.dart';
import '../../../../../core/presentation/widgets/ss_button_widget.dart';
import '../../../../../core/presentation/widgets/ss_link_text_widget.dart';

class OrderItemWidget extends StatelessWidget {
  final CafeOrder order;
  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: SSColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order.cafeName,
            style: Theme.of(context).textTheme.large(
                  SSColors.black,
                  fontWeight: FontWeightType.bold,
                ),
          ),
          Text(
            order.cafeAddress,
            style: Theme.of(context).textTheme.small(
                  SSColors.grey1,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.items[0].itemName.fitText(length: 25),
                style: Theme.of(context)
                    .textTheme
                    .medium(
                      SSColors.black,
                    )
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              Text(
                "₹${order.totalPaid}",
                style: Theme.of(context).textTheme.medium(
                      SSColors.black,
                      fontWeight: FontWeightType.bold,
                    ),
              ),
            ],
          ),
          Text(
            "Ordered On: ${order.orderDate.toString()}",
            style: Theme.of(context).textTheme.regular(
                  SSColors.grey1,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 32,
                width: 130,
                child: SSButtonWidget(
                  title: "Reorder",
                  onTap: () {},
                ),
              ),
              SSLinkTextWidget(
                  text: "View Details",
                  onTap: () {
                    context.pushToPage(
                      SSAppRoutes.cafeOrderDetails,
                      extra: {
                        "cafeOrder": order,
                      },
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
