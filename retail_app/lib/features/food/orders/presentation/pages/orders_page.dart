import 'package:flutter/material.dart';
import 'package:retail_app/features/food/orders/presentation/widgets/orders_list_widget.dart';

import '../../../../../core/presentation/widgets/ss_app_bar_widget.dart';
import '../../../common/utils/widget_utils/bottom_nav_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SSAppBarWidget(
        showTitle: true,
        title: "Orders",
        showLeadingIcon: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 6,
            ), // leave space for nav bar
            child: CustomScrollView(
              slivers: [
                OrdersListWidget(),
                SliverToBoxAdapter(
                  child: SizedBox(height: 65),
                )
              ],
            ),
          ),
          BottomNavWidget(activeIndex: 3),
        ],
      ),
    );
  }
}
