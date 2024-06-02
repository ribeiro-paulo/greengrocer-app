import 'package:greemgrocer/src/models/item.model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({required this.item, required this.quantity});
}
