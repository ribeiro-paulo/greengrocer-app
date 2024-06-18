import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/cart_item_model.dart';
import 'package:greemgrocer/src/models/order_model.dart';
import 'package:greemgrocer/src/pages/orders/components/order_status_widget.dart';
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
          initiallyExpanded: order.status == OrderStatus.pendingPayment,
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
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsService: utilsService,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsService.priceToCurrency(order.total),
                  )
                ],
              ),
            ),
            Visibility(
              visible: order.status == OrderStatus.pendingPayment,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
                onPressed: () {},
                icon: const Icon(Icons.pix),
                label: const Text(
                  'Ver QR Code Pix',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel orderItem;
  const _OrderItemWidget(
      {super.key, required this.utilsService, required this.orderItem});

  final UtilsService utilsService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.name)),
          Text(utilsService.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
