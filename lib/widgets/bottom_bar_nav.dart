import 'package:flutter/material.dart';

class Mybottombarnav extends StatelessWidget {
  final int cunrrentIndex;
  final ValueChanged<int> onTap;
  const Mybottombarnav({super.key, required this.cunrrentIndex, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: cunrrentIndex,
        onTap: onTap,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Mon Panier"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Mes Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Mon Profil"),
        ]
      );
  }
}
