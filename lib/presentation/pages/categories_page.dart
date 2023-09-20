import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Categories',style: TextStyle(fontSize: 24,color: Colors.white),),
        leading: Icon(Icons.list,color: Colors.white,size: 30,),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) =>Category(index: index,),
              itemCount: mealsCategory.length,
            ),
          ),
        ],
      ),
    );
  }
}
