import 'package:flutter/material.dart';
import 'package:retail_core/widgets/ss_dashed_divider.dart';

import 'cart_product_widget.dart';

class CartProductListingWidget extends StatelessWidget {
  const CartProductListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const Column(
          children: [
            CartProductWidget(),
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
