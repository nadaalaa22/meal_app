import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/category_data.dart';
import 'package:meals_app/data/datasource/meals_data.dart';

import '../../data/models/meal.dart';
import '../widgets/meal_item.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  //4
  var imageURLControl = TextEditingController();
  var nameControl = TextEditingController();
  var timeControl = TextEditingController();
  var stateControl = TextEditingController();

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
                controller: imageURLControl,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  prefixIcon: Icon(Icons.image),
                ),
              ),
              TextFormField(
                controller: nameControl,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: timeControl,
                decoration: InputDecoration(
                  labelText: 'Time',
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
              TextFormField(
                controller: stateControl,
                decoration: InputDecoration(
                  labelText: 'State',
                  prefixIcon: Icon(Icons.info),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  if (stateControl.text.isNotEmpty &&
                      timeControl.text.isNotEmpty &&
                      nameControl.text.isNotEmpty ) {
                    setState(() {
                      // Add the new meal to the list
                      var meal = Meal(
                        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
                        nameControl.text,
                        timeControl.text,
                        stateControl.text,
                        widget.id, // Pass the id from the constructor
                      );
                      Meals.add(meal);
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        backgroundColor: Colors.grey,
        title: Text(mealsCategory[widget.id].name,
          style: TextStyle(color: Colors.black),),


      ),
      body: ListView.separated(

        //hh
          itemBuilder: (_, i) =>
              MealGridTile(index: i,
                id: widget.id,
                meal: Meals.where((m) => m.id == widget.id).toList()[i],),
          separatorBuilder: (_, i) => SizedBox(height: 0,),
          itemCount: Meals.where((m) => m.id == widget.id).toList().length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCategoryBottomSheet(context),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
