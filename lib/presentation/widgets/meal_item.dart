import 'package:flutter/material.dart';

import '../../data/datasource/meals_data.dart';

class MealGridTile extends StatelessWidget {
  final int index;
  final int id;

  MealGridTile({super.key, required this.index, required this.id});
  listName(int index) {
    switch (index) {
      case 0:
        return italianMeals[index].name;
      case 1:
        return quickMeals[index].name;
      case 2:
        return hamburgerMeals[index].name;
      case 3:
        return germanMeals[index].name;
      case 4:
        return lightMeals[index].name;
      case 5:
        return exoticMeals[index].name;
      case 6:
        return breakfastMeals[index].name;
      case 7:
        return asionMeals[index].name;
      case 8:
        return frenchMeals[index].name;
      case 9:
        return summerMeals[index].name;
      default:
        return "Unknown Item";
    }
  }
  listTime(int index) {
    switch (index) {
      case 0:
        return italianMeals[index].time;
      case 1:
        return quickMeals[index].time;
      case 2:
        return hamburgerMeals[index].time;
      case 3:
        return germanMeals[index].time;
      case 4:
        return lightMeals[index].time;
      case 5:
        return exoticMeals[index].time;
      case 6:
        return breakfastMeals[index].time;
      case 7:
        return asionMeals[index].time;
      case 8:
        return frenchMeals[index].time;
      case 9:
        return summerMeals[index].time;
      default:
        return "Unknown Item";
    }
  }
  listState(int index) {
    switch (index) {
      case 0:
        return italianMeals[index].state;
      case 1:
        return quickMeals[index].state;
      case 2:
        return hamburgerMeals[index].state;
      case 3:
        return germanMeals[index].state;
      case 4:
        return lightMeals[index].state;
      case 5:
        return exoticMeals[index].state;
      case 6:
        return breakfastMeals[index].state;
      case 7:
        return asionMeals[index].state;
      case 8:
        return frenchMeals[index].state;
      case 9:
        return summerMeals[index].state;
      default:
        return "Unknown Item";
    }
  }
  listImage(int index) {
    switch (index) {
      case 0:
        return italianMeals[index].imageUrl;
      case 1:
        return quickMeals[index].imageUrl;
      case 2:
        return hamburgerMeals[index].imageUrl;
      case 3:
        return germanMeals[index].imageUrl;
      case 4:
        return lightMeals[index].imageUrl;
      case 5:
        return exoticMeals[index].imageUrl;
      case 6:
        return breakfastMeals[index].imageUrl;
      case 7:
        return asionMeals[index].imageUrl;
      case 8:
        return frenchMeals[index].imageUrl;
      case 9:
        return summerMeals[index].imageUrl;
      default:
        return "Unknown Item";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => PetInfo(index:index)));
        },
        child: Container(
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: Container(
                  height: 80,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            listName(id),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.white,
                              ),
                              Text(
                               listTime(id),
                                style:
                                TextStyle(color: Colors.white, fontSize: 24),
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.shopping_bag,
                                color: Colors.white,
                              ),
                              Text(
                                listState(id),
                                style:
                                TextStyle(color: Colors.white, fontSize: 24),
                              ),
                            ],
                          ),
                        ],
                      ))),
              child: Image.network(
               listImage(id),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
