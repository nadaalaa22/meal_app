import 'dart:convert';

import 'package:meals_app/category/data/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MealData {
  ///add [meal] data to [sharedPreference]
  ///
  /// throw an error
  Future<void> setMeal(Meal meal);

  ///get [all] [meals] from  [sharedPreference]
  ///
  /// throw an error
  Future<List<Meal>> getMeals();

  /// toggle between [Favorite] and [unFavorite]
  ///
  /// throw an error
  Future<void> toggleMealFavorite(String mealID);

  ///get [all] [ favorite ] [meal] from  [sharedPreference]
  ///
  /// throw an error
  Future<List<Meal>> getFavoriteMeals();

}

const String mealsKey = 'MealsList';

class MealDataImp implements MealData {
  @override
  Future<void> setMeal(Meal meal) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String mealJson = jsonEncode(meal.toMap());
    List<String> mealsJson = prefs.getStringList(mealsKey) ?? [];
    mealsJson.add(mealJson);
    await prefs.setStringList(mealsKey, mealsJson);
  }

  @override
  Future<List<Meal>> getMeals() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> mealsJson = prefs.getStringList(mealsKey) ?? [];
    List<Meal> meals = [];
    for (int i = 0; i < mealsJson.length; i++) {
      final petJson = mealsJson[i];
      final Map petMap = jsonDecode(petJson);
      Meal meal = Meal.fromMap(petMap);
      meals.add(meal);
    }

    return meals;
  }

  @override
  Future<void> toggleMealFavorite(String mealID) async {
    final meals = await getMeals();
    Meal? meal;
    for (int i = 0; i < meals.length; i++) {
      if (meals[i].id == mealID) {
        meal = meals[i];
      }
    }
    if (meal == null) throw Exception('meal not found');

    meal.isFavorite = !meal.isFavorite;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(mealsKey);
    for (int i = 0; i < meals.length; i++) {
      if (meals[i].id != mealID) {
        await setMeal(meals[i]);
      } else {
        await setMeal(meal);
      }
    }
  }

  @override
  Future<List<Meal>> getFavoriteMeals() async {
    final meals = await getMeals();
    List<Meal> favoriteMeals = [];
    for (int i = 0; i < meals.length; i++) {
      if (meals[i].isFavorite == true) {
        favoriteMeals.add(meals[i]);
      }
    }
    return favoriteMeals;
  }



}
