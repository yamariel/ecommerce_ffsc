import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  final mockProduct1 = Product(
    id: 1,
    name: "iPhone Test",
    price: 1000.0,
    description: "Test",
    image: "test.jpg",
    category: "Tech",
    rating: 5.0,
  );

  final mockProduct2 = Product(
    id: 2,
    name: "Casque Test",
    price: 200.0,
    description: "Test",
    image: "test.jpg",
    category: "Tech",
    rating: 4.0,
  );

  group('Tests du CartNotifier (Panier)', () {
    
    test('1. Le panier initial doit être complètement vide', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final cart = container.read(cartProvider);

      expect(cart.isEmpty, true);
      expect(cart.length, 0);
    });

    test('2. L\'ajout d\'un produit doit incrémenter la liste et mettre la quantité à 1', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(cartProvider.notifier).addProduct(mockProduct1);

      final cart = container.read(cartProvider);

      expect(cart.length, 1);
      expect(cart.first.product.name, "iPhone Test");
      expect(cart.first.quantity, 1);
    });

    test('3. L\'ajout du MÊME produit doit augmenter sa quantité, pas créer de nouvelle ligne', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(cartProvider.notifier).addProduct(mockProduct1);
      container.read(cartProvider.notifier).addProduct(mockProduct1);

      final cart = container.read(cartProvider);

      expect(cart.length, 1);
      expect(cart.first.quantity, 2);
    });

    test('4. Le calcul du prix total (cartTotalProvider) doit être exact', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(cartProvider.notifier).addProduct(mockProduct1, quantityToAdd: 2);
      container.read(cartProvider.notifier).addProduct(mockProduct2, quantityToAdd: 1);

      final total = container.read(cartTotalProvider);

      expect(total, 2200.0);
    });
  });
}