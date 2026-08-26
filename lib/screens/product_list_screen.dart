import 'package:ecommerce_app/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(productsProvider);
    return SafeArea(
      child: Scaffold(
        body: productsList.when(
          data: (products) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
            ),
            itemCount: products.length,
            itemBuilder: (context, i) => ProductCard(product: products[i], onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: products[i]),
                ),
              );
            }),
          ),
          error: (err, stack) => Center(child: Text('Erreur: $err')),
          loading: () => Center(child: const CircularProgressIndicator(color: Colors.blue,)),
        ),
      ),
    );
  }
}
