import 'package:appmeal/models/meals.dart';
import 'package:flutter/material.dart';

class detailscreen extends StatelessWidget {
  const detailscreen({super.key, required this.meal, required this.ontoggel});
  final Meal meal;
  final void Function(Meal meal) ontoggel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => ontoggel(meal), icon: Icon(Icons.star))
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageurl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 300,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'ingrediants',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ...meal.ingredients.map((e) => Text(e)),
            SizedBox(
              height: 10,
            ),
            Text(
              'steps',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            ...meal.steps.map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
