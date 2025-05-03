import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';
import 'package:retail_app/features/food/orders/domain/use_case/orders_use_case.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersUseCase ordersUseCase;
  OrdersCubit(this.ordersUseCase) : super(OrdersInitialState());

  void getOrders() async {
    emit(OrdersLoadingState());
    try {
      final List<CafeOrder> cafeOrders = await ordersUseCase.getOrders();
      emit(OrdersLoadedState(orders: cafeOrders)); // Replace with actual orders
    } catch (e) {
      emit(OrdersErrorState(message: e.toString()));
    }
  }
}
