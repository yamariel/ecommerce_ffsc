import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filter_provider.dart';
import '../screens/product_detail_screen.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList = ref.watch(filteredProductsProvider);
    
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final categories = ['Tous', 'Électronique', 'Vêtements', 'Chaussures', 'Accessoires'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          color: selectedCategory == category ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      selected: selectedCategory == category,
                      selectedColor: Colors.deepPurple,
                      backgroundColor: Colors.grey.shade200,
                      onSelected: (bool selected) {
                        if (selected) {
                          ref.read(selectedCategoryProvider.notifier).state = category;
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            
            Expanded(
              child: productsList.when(
                data: (products) {
                  if (products.isEmpty) {
                    return const Center(child: Text("Aucun produit dans cette catégorie."));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, i) => ProductCard(
                      product: products[i],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: products[i]),
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (err, stack) => Center(child: Text('Erreur: $err')),
                loading: () => const Center(child: CircularProgressIndicator(color: Colors.deepPurple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}