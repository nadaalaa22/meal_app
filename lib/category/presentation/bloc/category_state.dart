part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategoryLoadingState extends CategoryState {}
class CategoryLoadedState extends CategoryState {
  final List<CategoryDataa> category ;

  CategoryLoadedState({required this.category});
}

