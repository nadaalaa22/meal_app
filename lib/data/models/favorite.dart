import 'package:flutter/foundation.dart';

import 'meal.dart';

class FavoriteMealsModel extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void toggleFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
