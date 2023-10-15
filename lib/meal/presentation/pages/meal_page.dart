import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/meal/data/datasource/meal%20_local_datasource.dart';
import 'package:meals_app/meal/data/model/meal.dart';
import '../bloc/meal_bloc.dart';
import '../widget/meal_item.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  TextEditingController imageURLControl = TextEditingController();

  TextEditingController nameControl = TextEditingController();

  TextEditingController timeControl = TextEditingController();

  TextEditingController stateControl = TextEditingController();
  void showMeals(
      BuildContext context,
      ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: imageURLControl,
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                  prefixIcon: Icon(Icons.image),
                ),
              ),
              TextFormField(
                controller: nameControl,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.title),
                ),
              ),
              TextFormField(
                controller: timeControl,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
              TextFormField(
                controller: stateControl,
                decoration: const InputDecoration(
                  labelText: 'State',
                  prefixIcon: Icon(Icons.info),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (stateControl.text.isNotEmpty &&
                      timeControl.text.isNotEmpty &&
                      nameControl.text.isNotEmpty) {
                    var meal = Meal(
                      imageUrl: imageURLControl.text,
                      name: nameControl.text,
                      time: timeControl.text,
                      state: stateControl.text,
                      id: widget.id,
                    );
                    context.read<MealBloc>().add(SetMealEvent(meal: meal));
                    Navigator.pop(context);
                  }
                  setState(() {

                  });
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
    context.read<MealBloc>().add(GetMealEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        backgroundColor: Colors.purple,
        title: const Text(
          'Meals',
         // mealsCategory[widget.id as int].name,
          style: TextStyle(color: Colors.white),
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
      ),
      body: BlocBuilder<MealBloc , MealState>(
        builder: (context, state ) {
          if(state is MealLoadingState)
          {
            return const CircularProgressIndicator();
          }
          if(state is MealLoadedState) {
            return ListView.separated(
              itemBuilder: (_, i) => MealGridTile(
                    meal: state.meals.where((element) => element.id==widget.id).toList()[i],
                  ),
              separatorBuilder: (_, i) => const SizedBox(
                    height: 0,
                  ),
              itemCount:  state.meals.where((element) => element.id==widget.id).toList().length );
          }
          return const SizedBox(height: 10,);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMeals(
           context ,
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
