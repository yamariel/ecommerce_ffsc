import '../data/product_data.dart';
import '../models/product.dart';

class ProductRepository {
  //récupérer tous les produits
  Future<List<Product>> getAllProducts() async {
    return await Future.delayed(const Duration(seconds: 2), () => mockProducts);
  }

  //récupérer un produit par sont id
  Future<Product> getProductById(int id) async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => mockProducts.firstWhere((product) => product.id == id),
    );
  }
}
