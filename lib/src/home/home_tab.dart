import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                  backgroundColor: CustomColor.customContrastColor,
                  label: const Text(
                    '2',
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColor.customSwatchColor,
                  )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Pesquise aqui...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColor.customContrastColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ),
        ],
      ),
    );
  }
}
