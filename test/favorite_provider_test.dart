import 'package:ecommerce_app/providers/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Tests du FavoriteNotifier (Favoris)', () {
    setUp(() async {
      // reset le mock de shared_preferences avant chaque test
      SharedPreferences.setMockInitialValues({});
    });

    test('1. Les favoris initiaux doivent être vides', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final favorites = container.read(favoriteProvider);

      expect(favorites.isEmpty, true);
      expect(favorites.length, 0);
    });

    test('2. toggleFavorite doit ajouter un id et le persister dans SharedPreferences', () async {
      // s'assure qu'il n'y a pas de valeurs initiales enregistrées
      SharedPreferences.setMockInitialValues({});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      // ajouter l'id 1 aux favoris
      container.read(favoriteProvider.notifier).toggleFavorite(1);

      final favorites = container.read(favoriteProvider);
      expect(favorites.contains(1), true);
      expect(favorites.length, 1);

      // vérifier que SharedPreferences a bien été mis à jour
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getStringList('favorite_product_ids') ?? [];
      expect(stored, ['1']);
    });

    test('3. toggleFavorite sur le même id doit le retirer et persister la suppression', () async {
      // initialise prefs avec l'id 2 déjà présent
      SharedPreferences.setMockInitialValues({'favorite_product_ids': ['2']});

      final container = ProviderContainer();
      addTearDown(container.dispose);

      // retirer l'id 2
      container.read(favoriteProvider.notifier).toggleFavorite(2);

      final favorites = container.read(favoriteProvider);
      expect(favorites.contains(2), false);

      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getStringList('favorite_product_ids') ?? [];
      // saveFavorites enregistre une liste vide si aucun favori
      expect(stored, []);
    });
  });
}
