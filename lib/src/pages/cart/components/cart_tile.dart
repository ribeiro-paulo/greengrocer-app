import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/cart_item_model.dart';
import 'package:greemgrocer/src/pages/common_widgets/quantity_widget.dart';
import 'package:greemgrocer/src/services/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItemModel;
  final UtilsService utilsService = UtilsService();
  CartTile({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.asset(
          cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItemModel.item.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: QuantityWidget(
            value: cartItemModel.quantity,
            suffixText: cartItemModel.item.unit,
            result: (quantity) {}),
        subtitle: Text(
          utilsService.priceToCurrency(cartItemModel.totalPrice()),
          style: TextStyle(
              color: CustomColor.customSwatchColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
