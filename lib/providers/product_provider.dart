import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

//instancie le ProductRepository une seule fois.
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productDetailProvider = FutureProvider.autoDispose.family<Product, int>((ref, id) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProductById(id);
});

//appelle le repository et conserve la liste des produits en mémoire.
final productsProvider = FutureProvider<List<Product>>((ref) async {
  //On récupère notre repository grâce à ref.watch
  final repository = ref.watch(productRepositoryProvider);
  
  //On appelle la méthode et on retourne le Future
  return repository.getAllProducts();
});