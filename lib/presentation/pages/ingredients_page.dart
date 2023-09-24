import 'package:flutter/material.dart';

import '../../data/models/meal.dart';
import '../widgets/ingredient_info.dart';

class MealInfoPage extends StatefulWidget {
  final int index;
  final Meal meal;
  MealInfoPage({super.key, required this.index, required this.meal});
  @override
  State<MealInfoPage> createState() => _MealInfoPageState();
}

class _MealInfoPageState extends State<MealInfoPage> {
  bool isFavorite = false; // حالة المفضلة المحلية

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // قم بتبديل حالة المفضلة عند النقر
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealInformation(
        mealInfo: widget.meal,
      ),
    );
  }
}
