import 'package:flutter/material.dart';

import '../../data/datasource/category_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int index = 0;

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
        body: Column(children: [
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
          BottomNavigationBar(
            currentIndex: index,
            backgroundColor: Colors.white,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.set_meal,
                  color: Colors.black54,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black54,
                ),
                label: 'Favorite',

              )
            ],
          ),
        ]));
  }
}
