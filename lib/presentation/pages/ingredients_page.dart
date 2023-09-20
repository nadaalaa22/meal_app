import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/meals_data.dart';

import '../widgets/ingredient_info.dart';

class MealInfoPage extends StatelessWidget {
  final int index ;
  MealInfoPage({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MealInformation(MealInfo: summerMeals[index],),
    );
  }
}
