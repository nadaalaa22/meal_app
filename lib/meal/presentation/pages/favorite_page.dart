import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/meal/presentation/bloc/meal_bloc.dart';
import 'package:meals_app/meal/presentation/widget/meal_item.dart';

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

      ),
      body: BlocBuilder<MealBloc , MealState>(
        builder: (context, state) {
          if (state is MealLoadingState) {
            return CircularProgressIndicator();
          }
          if (state is MealLoadedState) {
            return ListView.builder(
            itemCount: state.meals.where((element) => element.isFavorite).length,
            itemBuilder: (_, i) {
              return MealGridTile(
                meal:  state.meals.where((element) => element.isFavorite).toList()[i],
              );
            },
          );
          }
          return const SizedBox(height: 10,);
        }

      ),
    );
  }
}
