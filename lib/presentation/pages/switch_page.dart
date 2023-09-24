import 'package:flutter/material.dart';

import 'categories_page.dart';
import 'favorite_page.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: currentIndex,
        children: [
          // الصفحة الأولى: CategoriesPage
          CategoriesPage(),

          // الصفحة الثانية: FavoritesPage
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
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
    );
  }
}

