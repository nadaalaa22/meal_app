import 'package:flutter/material.dart';

import '../../data/models/meal.dart';
import '../widgets/ingredient_info.dart';

class MealInfoPage extends StatefulWidget {
  final Meal meal;
  MealInfoPage({super.key, required this.meal});
  @override
  State<MealInfoPage> createState() => _MealInfoPageState();
}

class _MealInfoPageState extends State<MealInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MealInformation(
        mealInfo: widget.meal,
      ),
    );
  }
}
