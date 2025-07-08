import 'package:flutter/material.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/address_widget.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/apply_coupon_widget.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/cart_order_summary_widget.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/cart_product_listing_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';
import 'package:retail_core/widgets/ss_button_widget.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';

class CartMPage extends StatelessWidget {
  const CartMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surfaceM,
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: 'Checkout',
        showLeadingIcon: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddressWidget(),
              SizedBox(height: 16),
              CartProductListingWidget(),
              SizedBox(height: 12),
              ApplyCouponWidget(),
              SizedBox(height: 12),
              CartOrderSummaryWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 26.0,
        ),
        child: SSButtonWidget(
          elevation: 0,
          primaryColor: SSColors.actionM,
          title: "Checkout",
          onTap: () {},
        ),
      ),
    );
  }
}
