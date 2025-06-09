import 'package:appmeal/DATA/dummy_data.dart';
import 'package:appmeal/models/meals.dart';
import 'package:appmeal/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class categoryscreen extends StatelessWidget {
  const categoryscreen({super.key, required this.ontoggel});
  final void Function(Meal meal) ontoggel;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 10),
      children: [
        ...availablecategory.map((e) => categorygriditem(
              categori: e, ontoggel: ontoggel,
            )),
      ],
    ));
  }
}
