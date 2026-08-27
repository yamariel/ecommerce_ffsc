import 'package:flutter/material.dart';

import '../screens/product_list_screen.dart';
import '../widgets/bottom_bar_nav.dart';
import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProductListScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'e-Commerce FFSC',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: _pages[_currentIndex]
      ),
      bottomNavigationBar: Mybottombarnav(
        cunrrentIndex: _currentIndex, 
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}
