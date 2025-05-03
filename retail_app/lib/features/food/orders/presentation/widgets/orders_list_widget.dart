import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/di/service_locator.dart';
import 'package:retail_app/features/food/orders/cubit/orders_cubit.dart';

import '../../../../../core/presentation/widgets/ss_page_loader_widget.dart';
import '../../cubit/orders_state.dart';
import 'order_item_widget.dart';

class OrdersListWidget extends StatefulWidget {
  const OrdersListWidget({super.key});

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {
  final OrdersCubit ordersCubit = locator<OrdersCubit>();

  @override
  void initState() {
    ordersCubit.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: ordersCubit,
      builder: (context, state) {
        if (state is OrdersLoadingState) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: SSPageLoaderWidget(),
            ),
          );
        }
        if (state is OrdersLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12.0,
                    left: 20,
                    right: 20,
                  ),
                  child: OrderItemWidget(
                    order: state.orders[index],
                  ),
                );
              },
              childCount: state.orders.length, // This can be dynamic
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
