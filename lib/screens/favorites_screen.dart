import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favorite_provider.dart';
import '../screens/product_detail_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProductsAsync = ref.watch(favoriteProductsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Favoris"),
      ),
      body: favoriteProductsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.deepPurple)),
        error: (error, stack) => Center(child: Text('Erreur: $error')),
        data: (favoriteProducts) {
          
          if (favoriteProducts.isEmpty) {
            return const Center(child: Text("Aucun produit favori pour l'instant"));
          }

          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, i) {
              final product = favoriteProducts[i];
              
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.image, 
                    width: 50, 
                    height: 50, 
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  product.name, 
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${product.price} €",
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    ref.read(favoriteProvider.notifier).toggleFavorite(product.id);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(product: product),
                    ),
                  );
                },
              );
            }
          );
        },
      ),
    );
  }
}