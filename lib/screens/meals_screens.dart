import 'package:appmeal/models/meals.dart';
import 'package:appmeal/widgets/detail_screen.dart';
import 'package:appmeal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class mealsscreen extends StatelessWidget {
  const mealsscreen({super.key, this.title, required this.meals, required this.ontoggel});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) ontoggel;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
                title: Text(
                  title!,
                  style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 177, 175, 175)),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((e) => meatitem(
                  meals: e,
                  duration: e.duration,
                  compelxity: e.complexi,
                  affor: e.afforable,
                  onselected: (Meal e) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => detailscreen(meal: e, ontoggel:ontoggel,)));
                  },
                ))
            .toList(),
      ),
    );
  }
}
