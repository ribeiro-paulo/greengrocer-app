import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/models/item.model.dart';
import 'package:greemgrocer/src/pages/product/product_screen.dart';
import 'package:greemgrocer/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final GlobalKey widgetKey = GlobalKey();
  final void Function(GlobalKey) onClick;

  ItemTile({
    super.key,
    required this.item,
    required this.onClick,
  });

  UtilsService utilsService = UtilsService();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreen(
                item: item,
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
                          tag: item.imgUrl,
                          child: Container(
                            key: widgetKey,
                            child: Image.asset(
                              item.imgUrl,
                            ),
                          ))),
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsService.priceToCurrency(item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColor.customSwatchColor),
                      ),
                      Text(
                        '/${item.unit}',
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
                    onClick(widgetKey);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: CustomColor.customSwatchColor,
                    ),
                    height: 40,
                    width: 35,
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
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
