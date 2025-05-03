import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

abstract class OrdersState {
  const OrdersState();
}

class OrdersInitialState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<CafeOrder> orders;

  const OrdersLoadedState({required this.orders});
}

class OrdersErrorState extends OrdersState {
  final String message;

  const OrdersErrorState({required this.message});
}
