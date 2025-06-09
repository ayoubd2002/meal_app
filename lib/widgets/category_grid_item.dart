import 'package:appmeal/DATA/dummy_data.dart';
import 'package:appmeal/models/category.dart';
import 'package:appmeal/models/meals.dart';
import 'package:appmeal/screens/meals_screens.dart';
import 'package:flutter/material.dart';

class categorygriditem extends StatelessWidget {
  const categorygriditem({super.key, required this.categori, required this.ontoggel});

  final category categori;
  final void Function(Meal meal) ontoggel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> filtredmeal = dummymeal
            .where((element) => element.categories.contains(categori.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => mealsscreen(
            title: categori.categoryname,
            meals: filtredmeal, ontoggel:ontoggel,
          ),
        ));
      },
      splashColor: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          color: categori.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            categori.categoryname,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
