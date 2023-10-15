part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class SetCategoryEvent extends CategoryEvent {
  final CategoryDataa category ;

  SetCategoryEvent({required this.category});
}

class GetCategoryEvent extends CategoryEvent {}

