import 'package:flutter/material.dart';

import '../../data/datasource/meals_data.dart';
import '../../data/models/meal.dart';
import '../pages/ingredients_page.dart';

class MealGridTile extends StatelessWidget {
  final int index;
  final int id ;
  final Meal meal ;
  //4
  //10

   //3
  MealGridTile({super.key, required this.index, required this.id, required this.meal, });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealInfoPage(index:index, meal: meal,)));
        },
        child: Container(
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
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.white,
                              ),
                              Text(
                               meal.time,
                                style:
                                TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              Text(
                                meal.state,
                                style:
                                TextStyle(color: Colors.white, fontSize: 24),
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
