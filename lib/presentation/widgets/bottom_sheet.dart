import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../../data/datasource/meals_data.dart';
import '../../data/models/category.dart';
import '../../data/models/meal.dart';

class MealCategoryBottomSheet extends StatefulWidget {
  const MealCategoryBottomSheet({
    super.key,
  });

  static void showMeals(
    BuildContext context,
    int categoryId,
    TextEditingController imageURLControl,
    TextEditingController nameControl,
    TextEditingController timeControl,
    TextEditingController stateControl,
    VoidCallback setStateCallback,
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
                onPressed: () {
                  if (stateControl.text.isNotEmpty &&
                      timeControl.text.isNotEmpty &&
                      nameControl.text.isNotEmpty) {
                    var meal = Meal(
                      imageUrl: imageURLControl.text,
                      name: nameControl.text,
                      time: timeControl.text,
                      state: stateControl.text,
                      id: categoryId,
                    );
                    meals.add(meal);

                    // Close the bottom sheet
                    Navigator.of(context).pop();
                  }
                  setStateCallback;
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCategory(BuildContext context,TextEditingController titleControl ,
  TextEditingController idControl ,VoidCallback setStateCallback,) {


    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleControl,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: idControl,
                decoration: const InputDecoration(
                  labelText: 'Category id',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleControl.text.isNotEmpty) {
                    final MealCategory meal = MealCategory(
                      int.parse(idControl.text),
                      titleControl.text,
                      0xff32a852,
                    );
                    mealsCategory.add(meal);
                    setStateCallback;
                    Navigator.pop(context);
                  }

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
  State<MealCategoryBottomSheet> createState() =>
      _MealCategoryBottomSheetState();
}

class _MealCategoryBottomSheetState extends State<MealCategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
