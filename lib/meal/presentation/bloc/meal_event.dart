part of 'meal_bloc.dart';

@immutable
abstract class MealEvent {}
class SetMealEvent extends MealEvent {
  final Meal meal ;

  SetMealEvent({required this.meal});
}
class GetMealEvent extends MealEvent {}
class SetFavoriteMealEvent extends MealEvent {
  final String mealID ;

  SetFavoriteMealEvent({required this.mealID});
}
