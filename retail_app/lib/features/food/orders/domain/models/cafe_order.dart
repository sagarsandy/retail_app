class CafeOrder {
  final String orderId;
  final String cafeId;
  final String cafeName;
  final String cafeAddress;
  final List<CafeOrderItem> items;
  final String customerId;
  final String deliveryAddress;
  final String orderStatus;
  final DateTime orderDate;
  final num discount;
  final num deliveryCharge;
  final num platformFee;
  final num tax;
  final String paymentMethod;
  final num totalPrice;
  final num totalPaid;

  CafeOrder({
    required this.cafeAddress,
    required this.deliveryAddress,
    required this.discount,
    required this.deliveryCharge,
    required this.platformFee,
    required this.tax,
    required this.paymentMethod,
    required this.orderId,
    required this.cafeId,
    required this.cafeName,
    required this.customerId,
    required this.orderStatus,
    required this.orderDate,
    required this.items,
    required this.totalPrice,
    required this.totalPaid,
  });
}

class CafeOrderItem {
  final String itemId;
  final String itemName;
  final double itemPrice;
  final int quantity;

  CafeOrderItem({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.quantity,
  });
}
