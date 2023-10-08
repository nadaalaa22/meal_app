import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/categories_local_datasource/meal%20_local_datasource.dart';
import 'package:meals_app/data/datasource/category_data.dart';
import 'package:meals_app/data/datasource/meals_data.dart';

import '../../data/models/meal.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/meal_item.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  TextEditingController imageURLControl = TextEditingController();

  TextEditingController nameControl = TextEditingController();

  TextEditingController timeControl = TextEditingController();

  TextEditingController stateControl = TextEditingController();
  void showMeals(
      BuildContext context,
      ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: imageURLControl,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                  prefixIcon: Icon(Icons.image),
                ),
              ),
              TextFormField(
                controller: nameControl,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: timeControl,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
              TextFormField(
                controller: stateControl,
                decoration: const InputDecoration(
                  labelText: 'State',
                  prefixIcon: Icon(Icons.info),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (stateControl.text.isNotEmpty &&
                      timeControl.text.isNotEmpty &&
                      nameControl.text.isNotEmpty) {
                    var meal = Meal(
                      imageUrl: imageURLControl.text,
                      name: nameControl.text,
                      time: timeControl.text,
                      state: stateControl.text,
                      id: widget.id,
                    );

                    await  MealDataImp().setMeal(meal);
                    await  MealDataImp().getMeals().then((value) => print(value));
                    Navigator.pop(context);
                  }
                  setState(() {

                  });
                },
                child: const Text('Add'),
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
        // backgroundColor: Colors.black54,
        backgroundColor: Colors.purple,
        title: Text(
          'Meals',
         // mealsCategory[widget.id as int].name,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: MealDataImp().getMeals(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
          return ListView.separated(
              itemBuilder: (_, i) => MealGridTile(
                    meal: snapshot.data!.where((element) => element.id==widget.id).toList()[i],
                  ),
              separatorBuilder: (_, i) => const SizedBox(
                    height: 0,
                  ),
              itemCount:  snapshot.data!.where((element) => element.id==widget.id).toList().length );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMeals(
           context ,
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
