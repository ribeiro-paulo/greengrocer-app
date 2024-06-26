import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/cart_item_model.dart';
import 'package:greemgrocer/src/pages/cart/components/cart_tile.dart';
import 'package:greemgrocer/src/pages/common_widgets/payment_dialog.dart';
import 'package:greemgrocer/src/services/utils_services.dart';
import 'package:greemgrocer/src/config/app_data.dart' as app_data;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsService utilsService = UtilsService();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);

      utilsService.showToast(
          message: '${cartItem.item.name} removido(a) do carrinho');
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carrinho",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColor.customSwatchColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: app_data.cartItems.length,
                itemBuilder: (_, index) {
                  return CartTile(
                    cartItemModel: app_data.cartItems[index],
                    remove: removeItemFromCart,
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilsService.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColor.customSwatchColor,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PaymentDialog(
                                order: app_data.orders.first,
                              );
                            });
                      } else {
                        utilsService.showToast(
                            message: "Pedido não confirmado");
                      }
                    },
                    child: const Text("Concluir pedido"))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Sim"),
              )
            ],
          );
        });
  }
}
