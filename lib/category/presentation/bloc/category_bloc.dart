import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/category/data/datasource/categories_local_datasource/category_local_datasource.dart';
import 'package:meals_app/category/data/models/category.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is SetCategoryEvent) {
        emit(CategoryLoadingState());
        await CategoryDataImp().setCategoryData(event.category) ;
        List<CategoryDataa> categories = await CategoryDataImp().getCategoriesData() ;
        emit(CategoryLoadedState(category: categories)) ;
      }

      else if (event is GetCategoryEvent) {
        emit(CategoryLoadingState());
        List<CategoryDataa> categories = await CategoryDataImp().getCategoriesData() ;
        emit(CategoryLoadedState(category: categories)) ;

      }

    });
  }
}
