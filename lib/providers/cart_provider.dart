import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

//gère la logique métier du panier
class CartNotifier extends Notifier<List<CartItem>> {
  @override
  //Le panier est vide à l'état initiale
  List<CartItem> build() => [];

  //ajouter un produit dans le panier
  void addProduct(Product product) {
    final productExists = state.any((item) => item.product.id == product.id);

    if (productExists) {
      state = state.map((item) {
        if (item.product.id == product.id) {
          return item.copyWith(quantity: item.quantity + 1);
        }
        return item;
      }).toList();
    } else {
      state = [...state, CartItem(product: product, quantity: 1)];
    }
  }

  //supprimer un produit du panier
  void removeProduct(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  //ajuster ou retirer une quantité dans le panier
  void updateQuantity(int productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeProduct(productId);
    } else {
      state = state.map((item) {
        if (item.product.id == productId) {
          return item.copyWith(quantity: newQuantity);
        }
        return item;
      }).toList();
    }
  }

  //provider que l'interface va écouter
  final cartProvider = NotifierProvider<CartNotifier, List<CartItem>>(
    () => CartNotifier(),
  );
}
