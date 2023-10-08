
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category.dart';

abstract class CategoryData {
  ///add Category data to [sharedPreference]
  ///
  /// throw an error
  Future<void> setCategoryData(CategoryDataa category);

  ///get all Categories from  [sharedPreference]
  ///
  /// throw an error
  Future<List<CategoryDataa>> getCategoriesData();

}
const  String categoryKey = 'category' ;
class CategoryDataImp implements CategoryData {
  @override
  Future<List<CategoryDataa>> getCategoriesData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final categoriesJson = prefs.getStringList(categoryKey) ?? [];
    List<CategoryDataa> categoriesList = [];
    for (int i = 0; i < categoriesJson.length; i++) {
      final categoryJson = categoriesJson[i];
      final Map categoryMap = jsonDecode(categoryJson);
      CategoryDataa categories = CategoryDataa.fromMap(categoryMap);
      categoriesList.add(categories);
    }

    return categoriesList;
  }



  @override
  Future<void> setCategoryData( CategoryDataa category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String categoryJson = jsonEncode(category.toMap());
    List<String> categoriesJson = prefs.getStringList(categoryKey) ?? [];
    categoriesJson.add(categoryJson);
    await prefs.setStringList(categoryKey, categoriesJson);
  }
}

