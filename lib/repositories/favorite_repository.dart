import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository {
  //clé de recupération des données
  static const String _favoritesKey = 'favorite_product_ids';

  //sauvegarder la liste des ids des produits favoris
  Future<void> saveFavorites(List<int> favoriteIds) async {
    final prefs = await SharedPreferences.getInstance();

    //convertir les ids en string car shared_preferences ne lis que les string
    final favorites = favoriteIds.map((id) => id.toString()).toList();
    await prefs.setStringList(_favoritesKey, favorites);
  }

  //récupérer la liste des produits favoris via leur id
  Future<List<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final allFavorites = prefs.getStringList(_favoritesKey) ?? [];

    if (allFavorites.isEmpty) {
      return [];
    } else {
      return allFavorites.map((id) => int.parse(id)).toList();
    }
  }
}