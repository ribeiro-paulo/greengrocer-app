import 'package:flutter/material.dart';
import 'package:greemgrocer/src/models/order_model.dart';
import 'package:greemgrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({
    super.key,
    required this.order,
  });

  final UtilsService utilsService = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsService.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          children: [
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
