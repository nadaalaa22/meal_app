import 'package:flutter/material.dart';
import 'package:meals_app/data/datasource/categories_local_datasource/category_local_datasource.dart';

import '../../data/datasource/category_data.dart';
import '../../data/models/category.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/category_item.dart';

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
                      idControl.text,
                      titleControl.text,
                      '0xff32a852',
                    );
                    await  CategoryDataImp().setCategoryData(category);
                    await  CategoryDataImp().getCategoriesData().then((value) => print(value));
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
            child: FutureBuilder(
              future: CategoryDataImp().getCategoriesData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return CircularProgressIndicator();
                  }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                  ),
                  //index = 10
                  itemBuilder: (BuildContext context, int index) => CategoryItem(
                    categoryDataa:snapshot.data![index],
                  ),
                  itemCount:snapshot.data!.length,
                );
              }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showCategory(
              context,
            );
          });
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
