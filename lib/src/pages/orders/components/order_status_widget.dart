import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/order_model.dart';

class OrderStatusWidget extends StatelessWidget {
  final OrderStatus status;
  final bool isOverdue;
  final Map<OrderStatus, int> allStatus = <OrderStatus, int>{
    OrderStatus.pendingPayment: 0,
    OrderStatus.refunded: 1,
    OrderStatus.paid: 2,
    OrderStatus.preparingPurchase: 3,
    OrderStatus.shipping: 4,
    OrderStatus.delivered: 5
  };

  int get currentStatus => allStatus[status]!;
  OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOverdue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          title: 'Pedido confirmado',
          isActive: true,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            title: 'Pix estornado',
            isActive: true,
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            title: 'Pagamento pix vencido',
            isActive: true,
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            title: 'Pagamento',
            isActive: currentStatus >= 2,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Preparando',
            isActive: currentStatus >= 3,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Envio',
            isActive: currentStatus >= 4,
          ),
          const _CustomDivider(),
          _StatusDot(
            title: 'Entregue',
            isActive: currentStatus == 5,
          ),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;
  const _StatusDot(
      {super.key,
      required this.isActive,
      required this.title,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: (backgroundColor ?? CustomColor.customSwatchColor),
            ),
            color: isActive
                ? (backgroundColor ?? CustomColor.customSwatchColor)
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ))
      ],
    );
  }
}
