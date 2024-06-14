import 'package:greemgrocer/src/models/cart_item_model.dart';

enum OrderStatus {
  pendingPayment,
  refunded,
  paid,
  preparingPurchase,
  shipping,
  delivered
}

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  OrderStatus status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
