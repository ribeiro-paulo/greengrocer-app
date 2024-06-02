import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/services/utils_services.dart';
import 'package:greemgrocer/src/config/app_data.dart' as app_data;

class CartTab extends StatelessWidget {
  CartTab({super.key});
  final UtilsService utilsService = UtilsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carrinho",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: app_data.cartItems.length,
                itemBuilder: (_, index) {
                  return Text(app_data.cartItems[index].item.name);
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
                  utilsService.priceToCurrency(50.5),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColor.customSwatchColor,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Concluir pedido"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
