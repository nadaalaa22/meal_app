import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../widgets/bottom_sheet.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Categories',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: const Icon(
          Icons.list,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          setState(() {
            MealCategoryBottomSheet.showCategory(
              context,
              titleControl,
              idControl,
              () {
                setState(() {});
              },
            );
          });
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
