import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../../data/models/category.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int index = 0;
  var titleControl = TextEditingController();
  var idControl = TextEditingController();
  void _showAddCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleControl,
                decoration: InputDecoration(
                  label: Text('Category Name'),
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: idControl,
                decoration: InputDecoration(
                  label: Text('Category id'),
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  // Get the category name from the TextFormField
                  String categoryName = titleControl.text;
                  if (categoryName.isNotEmpty) {
                    setState(() {
                      // Add the new category to the list
                       var meal =MealCategory(int.parse(idControl.text),titleControl.text,0xff32a852);
                      mealsCategory.add(meal);
                    });
                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Categories',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          leading: Icon(
            Icons.list,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                ),
                //index = 10
                itemBuilder: (BuildContext context, int index) => Category(
                  index: index,
                ),
                itemCount: mealsCategory.length,
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCategoryBottomSheet(context);
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.purple,
      ),

    );
  }
}
