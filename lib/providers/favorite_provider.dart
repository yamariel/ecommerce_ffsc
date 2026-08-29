import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/favorite_repository.dart';

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) => FavoriteRepository());


class FavoriteNotifier extends Notifier<List<int>> {
  @override
  List<int> build() {
    _loadFavorites();
    return [];
  }

  //charger les produits favoris
  Future<void> _loadFavorites() async {
    final repo = ref.read(favoriteRepositoryProvider);
    state =  await repo.getFavorites();
  }
  
  //ajouter|retirer un produit du favoris
  void toggleFavorite(int productId){
    bool isFavorite = state.contains(productId);

    if (isFavorite) {
      //si le produit est un favori crée une nouvelle liste sans ce produit
      state = state.where((id) => id != productId).toList();
    } else {
      //sinon garde les favoris précedent et ajoute le nouveau favoris
      state = ([...state, productId]);
    }
    //sauvegarde les favoris
    ref.read(favoriteRepositoryProvider).saveFavorites(state);
  }

}

final favoriteProvider = NotifierProvider<FavoriteNotifier, List<int>>(() => FavoriteNotifier());