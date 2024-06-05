import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/cart_item_model.dart';
import 'package:greemgrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greemgrocer/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItemModel;
  final Function(CartItemModel) remove;
  const CartTile({
    super.key,
    required this.cartItemModel,
    required this.remove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsService utilsService = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          widget.cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItemModel.item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: QuantityWidget(
          value: widget.cartItemModel.quantity,
          suffixText: widget.cartItemModel.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItemModel.quantity = quantity;
              if (quantity == 0) {
                widget.remove(widget.cartItemModel);
              }
            });
          },
          isRemovable: true,
        ),
        subtitle: Text(
          utilsService.priceToCurrency(widget.cartItemModel.totalPrice()),
          style: TextStyle(
              color: CustomColor.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
