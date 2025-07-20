import 'package:flutter/material.dart';
import 'package:retail_app/core/ext/color_ext.dart';
import 'package:retail_app/features/mart/order_details/presentation/widgets/order_details_order_summary_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../../../common/widgets/address_widget.dart';
import '../widgets/order_details_product_listing_widget.dart';

class OrderDetailsMPage extends StatelessWidget {
  const OrderDetailsMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.transparent.surface(),
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: 'Order Details',
        showLeadingIcon: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddressWidget(),
              SizedBox(height: 16),
              OrderDetailsProductListingWidget(),
              SizedBox(height: 12),
              OrderDetailsOrderSummaryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
