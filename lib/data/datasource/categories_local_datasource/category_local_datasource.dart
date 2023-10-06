
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category.dart';

abstract class CategoryData {
  ///add Category data to [sharedPreference]
  ///
  /// throw an error
  Future<void> setCategoryData(Categories category);

  ///get all Categories from  [sharedPreference]
  ///
  /// throw an error
  Future<List<Categories>> getCategoriesData();

}

class CategoryDataImp implements CategoryData {
  @override
  Future<List<Categories>> getCategoriesData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final categoryStrings = prefs.getStringList('categories') ?? [];

    // Create a list to store the decoded Categories objects
    final List<Categories> categoriesList = [];

    // Decode each category string and add it to the list
    for (final categoryString in categoryStrings) {
      final jsonMap = jsonDecode(categoryString);
      final category = Categories.fromMap(jsonMap);
      categoriesList.add(category);
    }

    return categoriesList;
  }


  @override
  Future<void> setCategoryData( Categories category) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonUser = jsonEncode(category.toMap());
    await prefs.setString('categoryID', jsonUser);
  }
}

