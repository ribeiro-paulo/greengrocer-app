import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/app_data.dart' as app_data;
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pedidos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColor.customSwatchColor,
      ),
      body: ListView.separated(
          padding: const EdgeInsetsDirectional.all(16),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => OrderTile(
                order: app_data.orders[index],
              ),
          separatorBuilder: (_, index) => const SizedBox(
                height: 10,
              ),
          itemCount: app_data.orders.length),
    );
  }
}
