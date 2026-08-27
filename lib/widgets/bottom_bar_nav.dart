import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class Mybottombarnav extends StatefulWidget {
  const Mybottombarnav({super.key});
  @override
  State<Mybottombarnav> createState() => _MybottombarnavState();
}

class _MybottombarnavState  extends State<Mybottombarnav>{
  int _currentIndex = 0;

  void incrementeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: incrementeIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Panier"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favori"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ]
      ),
    );
  }
}