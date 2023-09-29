import 'package:flutter/material.dart';

import '../../data/datasource/meals_data.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'FAVORITE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: meals.where((m) => m.isFavorite == true).toList().length,
        itemBuilder: (_, i) {
          return MealGridTile(
            meal: meals.where((m) => m.isFavorite == true).toList()[i],
          );
        },
      ),
    );
  }
}
