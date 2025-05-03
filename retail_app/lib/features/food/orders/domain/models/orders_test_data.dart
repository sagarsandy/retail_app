import 'package:retail_app/features/food/orders/domain/models/cafe_order.dart';

class OrdersTestData {
  final CafeOrderItem item1 = CafeOrderItem(
    itemId: "item_1",
    itemName: "Chicken Biryani",
    itemPrice: 200.0,
    quantity: 2,
  );
  final CafeOrderItem item2 = CafeOrderItem(
    itemId: "item_2",
    itemName: "Paneer Butter Masala",
    itemPrice: 150.0,
    quantity: 1,
  );
  final CafeOrderItem item3 = CafeOrderItem(
    itemId: "item_3",
    itemName: "Garlic Naan",
    itemPrice: 50.0,
    quantity: 3,
  );

  List<CafeOrder> userOrdersData() {
    return [
      CafeOrder(
        orderId: "order_1",
        cafeId: "vj_1",
        cafeName: "Silver Dum Biryani",
        cafeAddress: "Panta kaluva road, Vijayawada",
        items: [item1, item2],
        customerId: "customer_1",
        deliveryAddress: "MG Road, Vijayawada",
        orderStatus: "Delivered",
        orderDate: DateTime.now(),
        discount: 10.0,
        deliveryCharge: 20.0,
        platformFee: 5.0,
        tax: 15.0,
        paymentMethod: "Credit Card",
        totalPrice: 400.0,
        totalPaid: 400.0,
      ),
      CafeOrder(
        orderId: "order_2",
        cafeId: "vj_2",
        cafeName: "Golden Spoon",
        cafeAddress: "MG Road, Vijayawada",
        items: [item3],
        customerId: "customer_2",
        deliveryAddress: "Benz Circle, Vijayawada",
        orderStatus: "Pending",
        orderDate: DateTime.now(),
        discount: 5.0,
        deliveryCharge: 15.0,
        platformFee: 3.0,
        tax: 10.0,
        paymentMethod: "Cash on Delivery",
        totalPrice: 200.0,
        totalPaid: 200.0,
      ),
      CafeOrder(
        orderId: "order_3",
        cafeId: "vj_3",
        cafeName: "Spicy Treat",
        cafeAddress: "Benz Circle, Vijayawada",
        items: [item1, item3],
        customerId: "customer_3",
        deliveryAddress: "Eluru Road, Vijayawada",
        orderStatus: "Cancelled",
        orderDate: DateTime.now(),
        discount: 0.0,
        deliveryCharge: 0.0,
        platformFee: 0.0,
        tax: 0.0,
        paymentMethod: "Credit Card",
        totalPrice: 300.0,
        totalPaid: 300.0,
      ),
    ];
  }
}
