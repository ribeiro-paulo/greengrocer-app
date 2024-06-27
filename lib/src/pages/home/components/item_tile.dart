import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/item.model.dart';
import 'package:greemgrocer/src/pages/product/product_screen.dart';
import 'package:greemgrocer/src/services/utils_services.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) onClick;

  const ItemTile({
    super.key,
    required this.item,
    required this.onClick,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey widgetKey = GlobalKey();

  UtilsService utilsService = UtilsService();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);

    await Future.delayed(const Duration(milliseconds: 1500));

    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(
                item: widget.item,
              );
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Hero(
                          tag: widget.item.imgUrl,
                          child: Container(
                            key: widgetKey,
                            child: Image.asset(
                              widget.item.imgUrl,
                            ),
                          ))),
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsService.priceToCurrency(widget.item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColor.customSwatchColor),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(20),
              ),
              child: Material(
                child: InkWell(
                  onTap: () {
                    switchIcon();
                    widget.onClick(widgetKey);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: CustomColor.customSwatchColor,
                    ),
                    height: 40,
                    width: 35,
                    child: Icon(
                      tileIcon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
