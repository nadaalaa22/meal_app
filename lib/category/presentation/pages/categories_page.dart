import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category/presentation/bloc/category_bloc.dart';
import '../../data/models/category.dart';
import '../widgets/category_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int index = 0;
  var titleControl = TextEditingController();
  var idControl = TextEditingController();
   void showCategory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleControl,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: idControl,
                decoration: const InputDecoration(
                  labelText: 'Category id',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (titleControl.text.isNotEmpty) {
                    final CategoryDataa category = CategoryDataa(
                      titleControl.text,
                      idControl.text,
                      '0xff32a852',
                    );
                    context.read<CategoryBloc>().add(SetCategoryEvent(category: category)) ;

                    Navigator.pop(context);
                    setState(() {
                    });

                  }

                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryBloc>().add(GetCategoryEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Categories',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: const Icon(
          Icons.list,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CategoryBloc , CategoryState>(
              builder: (context, state) {
                if(state is CategoryLoadingState)
                  {
                    return CircularProgressIndicator();
                  }
                if (state is CategoryLoadedState) {
                  return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                  ),

                  itemBuilder: (BuildContext context, int index) => CategoryItem(
                    categoryDataa:state.category[index],
                  ),
                  itemCount:state.category.length,
                );
                }
                return SizedBox(height: 10,);
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCategory(
            context,
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
