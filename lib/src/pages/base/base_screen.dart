import 'package:flutter/material.dart';
import 'package:greemgrocer/src/pages/cart/cart_tab.dart';
import 'package:greemgrocer/src/pages/home/home_tab.dart';
import 'package:greemgrocer/src/pages/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currrentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomeTab(),
          const CartTab(),
          Container(color: Colors.blue),
          const ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currrentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        currentIndex: currrentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Perfil')
        ],
      ),
    );
  }
}
