import 'package:flutter/material.dart';
import '../../data/models/category.dart';
import '../../../meal/presentation/pages/meal_page.dart';

class CategoryItem extends StatelessWidget {
  final CategoryDataa categoryDataa ;
  const CategoryItem({super.key, required this.categoryDataa});
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
              color: const Color(0xffB19CD9),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  categoryDataa.name,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
