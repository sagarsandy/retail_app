import 'package:flutter/material.dart';
import 'package:retail_app/features/mart/orders/presentation/widgets/orders_list_item_widget.dart';
import 'package:retail_core/theme/ss_colors.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';

class OrdersMPage extends StatelessWidget {
  const OrdersMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SSColors.surfaceM,
      appBar: const SSAppBarWidget(
        showTitle: true,
        title: 'Order History',
        showLeadingIcon: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const OrdersListItemWidget();
        },
      ),
    );
  }
}
