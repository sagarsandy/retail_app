import 'package:flutter/material.dart';
import 'package:retail_app/features/mart/cart/presentation/widgets/address_widget.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const AddressWidget(),
              const SizedBox(height: 16),
              const CartProductListingWidget(),
              const SizedBox(height: 16),
              Container(
                height: 200,
                // width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
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
