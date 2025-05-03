import 'package:retail_app/features/food/orders/domain/models/orders_test_data.dart';

import '../models/cafe_order.dart';

class OrdersUseCase {
  final OrdersTestData ordersTestData = OrdersTestData();

  OrdersUseCase();

  Future<List<CafeOrder>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));
    return ordersTestData.userOrdersData();
  }
}
