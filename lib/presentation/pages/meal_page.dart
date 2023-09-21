import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/category_data.dart';
import 'package:meals_app/data/datasource/meals_data.dart';

import '../widgets/meal_item.dart';

class MealPage extends StatelessWidget {
  const MealPage({Key? key, required this.id}) : super(key: key);

  final int id;
  //4
  //10

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
       // backgroundColor: Colors.black54,
        backgroundColor: Colors.grey,
        title: Text(mealsCategory[id].name,style: TextStyle(color: Colors.black),),

      ),
      body: ListView.separated(

        //hh
          itemBuilder: (_, i) => MealGridTile(index: i ,id:  id,meal: Meals.where((m) => m.id == id).toList()[i],),
          separatorBuilder: (_, i) => SizedBox(height: 0,),
          itemCount: 3),
    );

  }

}
