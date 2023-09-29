import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/category_data.dart';
import 'package:meals_app/data/datasource/meals_data.dart';

import '../widgets/bottom_sheet.dart';
import '../widgets/meal_item.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  TextEditingController imageURLControl = TextEditingController();

  TextEditingController nameControl = TextEditingController();

  TextEditingController timeControl = TextEditingController();

  TextEditingController stateControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        backgroundColor: Colors.purple,
        title: Text(
          mealsCategory[widget.id].name,
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
      body: ListView.separated(

          //hh
          itemBuilder: (_, i) => MealGridTile(
                meal: meals.where((m) => m.id == widget.id).toList()[i],
              ),
          separatorBuilder: (_, i) => const SizedBox(
                height: 0,
              ),
          itemCount: meals.where((m) => m.id == widget.id).toList().length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MealCategoryBottomSheet.showMeals(
            context,
            widget.id,
            imageURLControl,
            nameControl,
            timeControl,
            stateControl,
            () {
              setState(() {});
            },
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
