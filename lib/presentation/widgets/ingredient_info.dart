import 'package:flutter/material.dart';

import '../../data/models/meal.dart';

class MealInformation extends StatelessWidget {
  final Meal mealInfo;

  const MealInformation({super.key, required this.mealInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        title: Text(
          ' ${mealInfo.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                child: Image(
                  image: NetworkImage(mealInfo.imageUrl),
                  fit: BoxFit.cover,
                )),
            Text(
              'Name : ${mealInfo.name}',
              style: const TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              ' ingredients',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              '4 chicken breasts  ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '1 onion  ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '2 glovis of garlic  ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '1 piece of ginger ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '500ml cocount milk ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '1 onion  ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              'Steps ',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              'Slice and fry the chicken breast',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const Text(
              '500ml cocount milk ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
