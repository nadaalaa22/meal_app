import 'package:flutter/material.dart';

import '../../data/datasource/categories_local_datasource/meal _local_datasource.dart';
import '../../data/models/meal.dart';


class MealInfoPage extends StatefulWidget {
  final Meal meal;

  const MealInfoPage({
    super.key,
    required this.meal,
  });

  @override
  State<MealInfoPage> createState() => _MealInfoPageState();
}

class _MealInfoPageState extends State<MealInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          ' ${widget.meal.name}',
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
        actions: [
          IconButton(
            icon: Icon(
              widget.meal.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
              MealDataImp().toggleMealFavorite(widget.meal.id);
              setState(() {
                widget.meal.isFavorite = !widget.meal.isFavorite;
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                child: Image(
                  image: NetworkImage('https://www.shutterstock.com/shutterstock/photos/1010843569/display_1500/stock-photo-fettuccine-pasta-italian-cuisine-1010843569.jpg'),
                  fit: BoxFit.cover,
                )),
            Text(
              'Name : ${widget.meal.name}',
              style: const TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              ' ingredients',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              '4 chicken breasts  ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '1 onion  ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '2 glovis of garlic  ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '1 piece of ginger ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '500ml cocount milk ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '1 onion  ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              'Steps ',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Text(
              'Slice and fry the chicken breast',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const Text(
              '500ml cocount milk ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
