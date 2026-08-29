# Application E-Commerce Flutter

Une application mobile e-commerce moderne, fluide et réactive développée avec Flutter. Ce projet met particulièrement l'accent sur une architecture propre et une gestion d'état avancée et robuste utilisant **Riverpod**.

## Fonctionnalités Principales

*   **Catalogue Dynamique :** Affichage en grille des produits avec un système de filtrage par catégorie (ChoiceChips).
*   **Détails Produit :** Vue détaillée avec animations de transition (Hero Animations) pour une expérience utilisateur fluide.
*   **Gestion du Panier (Cart) :**
    *   Ajout de produits avec sélection de la quantité.
    *   Mise à jour en temps réel (incrémentation/décrémentation).
    *   Calcul automatique du prix total.
    *   Badge dynamique indiquant le nombre d'articles dans le panier.
*   **Système de Favoris (Wishlist) :** 
    *   Ajout/suppression de produits en favoris.
    *   Persistance des données locales grâce à `shared_preferences` (les favoris restent sauvegardés même après la fermeture de l'application).
    *   Écran dédié listant l'ensemble des coups de cœur.

## Stack Technique

*   **Framework :** [Flutter](https://flutter.dev/) (Dart)
*   **Gestion d'État :** [Riverpod](https://riverpod.dev/) (`flutter_riverpod`)
    *   Utilisation de `NotifierProvider` pour les logiques métiers complexes (Panier, Favoris).
    *   Utilisation de `FutureProvider` pour le chargement des données.
    *   Utilisation de `StateProvider` pour les filtres simples.
    *   Création de Providers dérivés pour croiser les données (ex: Filtrage réactif).
*   **Stockage Local :** `shared_preferences`


## Comment lancer le projet

### Prérequis
Avant de commencer, assurez-vous d'avoir installé les éléments suivants sur votre machine :
*   [Flutter SDK](https://docs.flutter.dev/get-started/install)
*   Un éditeur de code (recommandé : [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio) avec les extensions Flutter/Dart)
*   Un émulateur configuré (Android/iOS) ou un téléphone physique branché avec le mode développeur activé.

### Étapes d'installation

1. **Cloner le dépôt de l'application :**
   Ouvrez votre terminal et exécutez la commande suivante :
   ```bash
   git clone https://github.com/yamariel/ecommerce_ffsc
   cd ecommerce_ffsc
## Architecture du Projet

2. **Récupérer les dépendances :**
```bash 
flutter pub get


Le projet suit une architecture modulaire séparant la logique métier de l'interface utilisateur :

```text
lib/
 ┣ models/           # Classes de données (ex: Product, CartItem)
 ┣ providers/        # Logique métier et gestion d'état (Riverpod Notifiers)
 ┣ repositories/     # Gestion des accès aux données (ex: Sauvegarde locale)
 ┣ screens/          # Vues principales de l'application (Pages)
 ┣ widgets/          # Composants UI réutilisables (ProductCard, QuantityButton...)
 ┗ main.dart         # Point d'entrée de l'application
