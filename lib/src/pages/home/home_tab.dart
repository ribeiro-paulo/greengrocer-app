import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/pages/home/components/category_tile.dart';
import 'package:greemgrocer/src/config/app_data.dart' as mock;
import 'package:greemgrocer/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

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
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: mock.categories[index],
                    isSelected: mock.categories[index] == selectedCategory,
                    onPress: () {
                      setState(() {
                        selectedCategory = mock.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: mock.categories.length),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5),
                itemCount: mock.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: mock.items[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
