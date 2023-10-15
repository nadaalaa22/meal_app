import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/meal/data/datasource/meal%20_local_datasource.dart';
import 'package:meals_app/meal/data/model/meal.dart';
import 'package:meta/meta.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) async {
      if ( event is SetMealEvent){
        emit(MealLoadingState());
        await MealDataImp().setMeal(event.meal) ;
        List<Meal> meals = await MealDataImp().getMeals();
        emit(MealLoadedState(meals: meals));
      }
      else if (event is GetMealEvent) {
        emit(MealLoadingState());
        List<Meal> meals = await MealDataImp().getMeals();
        emit(MealLoadedState(meals: meals));
      }

      else if (event is SetFavoriteMealEvent) {
        await MealDataImp().toggleMealFavorite(event.mealID);
        emit(MealLoadingState());
        List<Meal> meals = await MealDataImp().getMeals();
        emit(MealLoadedState(meals: meals));
      }
    });
  }
}
