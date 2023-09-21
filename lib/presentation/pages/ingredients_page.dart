import 'package:flutter/material.dart';

import '../../data/models/meal.dart';
import '../widgets/ingredient_info.dart';

class MealInfoPage extends StatelessWidget {
  final int index ;
  final Meal meal ;
  MealInfoPage({super.key, required this.index, required this.meal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MealInformation(mealInfo: meal,),
    );
  }
}
