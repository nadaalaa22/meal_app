import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/categories_local_datasource/meal%20_local_datasource.dart';

import '../../data/datasource/meals_data.dart';
import '../widgets/meal_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'FAVORITE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
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
        future: MealDataImp().getFavoriteMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, i) {
              return MealGridTile(
                meal:  snapshot.data![i],
              );
            },
          );
        }
      ),
    );
  }
}
