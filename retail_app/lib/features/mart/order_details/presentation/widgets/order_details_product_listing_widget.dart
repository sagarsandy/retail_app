import 'package:flutter/material.dart';
import 'package:retail_app/features/mart/order_details/presentation/widgets/order_details_product_widget.dart';
import 'package:retail_core/widgets/ss_dashed_divider.dart';

class OrderDetailsProductListingWidget extends StatelessWidget {
  const OrderDetailsProductListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const Column(
          children: [
            OrderDetailsProductWidget(),
            Visibility(
              visible: true,
              child: SSDashedDivider(),
            ),
          ],
        );
      },
    );
  }
}
