import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/product.dart';
import 'product_provider.dart';

final selectedCategoryProvider = StateProvider<String>((ref) {
  return 'Tous';
});

final filteredProductsProvider = FutureProvider<List<Product>>((ref) async {
  
  final allProducts = await ref.watch(productsProvider.future);
  
  final selectedCategory = ref.watch(selectedCategoryProvider);
  
  if (selectedCategory == 'Tous') {
    return allProducts;
  } else {
    return allProducts.where((product) => product.category == selectedCategory).toList();
  }
});