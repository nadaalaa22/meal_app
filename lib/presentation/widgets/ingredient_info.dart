import 'package:flutter/material.dart';

import '../../data/models/meal.dart';

class MealInformation extends StatefulWidget {
  final Meal mealInfo;

  const MealInformation({
    super.key,
    required this.mealInfo,
  });

  @override
  State<MealInformation> createState() => _MealInformationState();
}

class _MealInformationState extends State<MealInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          ' ${widget.mealInfo.name}',
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
              widget.mealInfo.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {
             setState(() {
               widget.mealInfo.isFavorite = !widget.mealInfo.isFavorite;
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
                  image: NetworkImage(widget.mealInfo.imageUrl),
                  fit: BoxFit.cover,
                )),
            Text(
              'Name : ${widget.mealInfo.name}',
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
