import 'package:flutter/material.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onPress});
  final String category;
  final bool isSelected;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              color: isSelected
                  ? CustomColor.customSwatchColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            category,
            style: TextStyle(
                color:
                    isSelected ? Colors.white : CustomColor.customContrastColor,
                fontWeight: FontWeight.bold,
                fontSize: isSelected ? 16 : 14),
          ),
        ),
      ),
    );
  }
}
