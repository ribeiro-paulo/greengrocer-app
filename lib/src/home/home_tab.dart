import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text.rich(TextSpan(
          style: const TextStyle(fontSize: 30),
          children: [
            TextSpan(
                text: 'Green',
                style: TextStyle(color: CustomColor.customSwatchColor)),
            TextSpan(
                text: 'grocer',
                style: TextStyle(color: CustomColor.customContrastColor))
          ],
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: CustomColor.customSwatchColor,
              ))
        ],
      ),
    );
  }
}
