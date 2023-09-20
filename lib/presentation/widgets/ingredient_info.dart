import 'package:flutter/material.dart';

import '../../data/models/meal.dart';
class MealInformation extends StatelessWidget {
  final Meal MealInfo;
  MealInformation({required  this.MealInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor:  Colors.black.withOpacity(0.5),
        title: Text(' ${MealInfo.name}',style: TextStyle(color: Colors.white), ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage('https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg')),
          Text('Name : ${MealInfo.name}',style: TextStyle(color: Colors.orange,fontSize: 24),),
          Text(' ingredients',style: TextStyle(color: Colors.orange,fontSize: 24),),

          Text('4 chicken breasts  ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('1 onion  ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('2 glovis of garlic  ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('1 piece of ginger ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('500ml cocount milk ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('1 onion  ',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('Steps ',style: TextStyle(color: Colors.orange,fontSize: 24),),
          Text('Slice and fry the chicken breast',style: TextStyle(color: Colors.white,fontSize: 18),),
          Text('500ml cocount milk ',style: TextStyle(color: Colors.white,fontSize: 18),),

         
        ],
      ),
    );
  }
}
