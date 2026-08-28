import 'package:ecommerce_app/screens/product_detail_screen.dart';
import 'package:ecommerce_app/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);

    if (cartItems.isEmpty) {
      return Scaffold(body: Center(child: const Text('Votre panier est vide')));
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return CartItemCard(
                  product: cartItem.product,
                  quantity: cartItem.quantity,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(product: cartItem.product),
                      ),
                    );
                  },
                  onDelete: () => ref.read(cartProvider.notifier).removeProduct(cartItem.product.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
