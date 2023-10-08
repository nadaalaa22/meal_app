import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../../data/datasource/meals_data.dart';
import '../../data/models/category.dart';
import '../../data/models/meal.dart';
import '../pages/meal_page.dart';

class CategoryItem extends StatelessWidget {
  final CategoryDataa categoryDataa ;

  CategoryItem({super.key, required this.categoryDataa});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(id:categoryDataa.id )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: Container(
              width: 150,
              height: 150,
              color: Color(0xffCBC3E3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  categoryDataa.name,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
