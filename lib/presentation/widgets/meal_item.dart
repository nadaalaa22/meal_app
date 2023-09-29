import 'package:flutter/material.dart';

import '../../data/models/meal.dart';
import '../pages/ingredients_page.dart';

class MealGridTile extends StatelessWidget {
  final Meal meal;

  const MealGridTile({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MealInfoPage(
                        meal: meal,
                      )));
        },
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: Container(
                  height: 80,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        meal.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            meal.time,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          Text(
                            meal.state,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    ],
                  ))),
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
