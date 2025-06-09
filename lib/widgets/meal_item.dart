import 'package:appmeal/models/meals.dart';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class meatitem extends StatelessWidget {
  const meatitem(
      {super.key,
      required this.meals,
      required this.duration,
      required this.compelxity,
      required this.affor, required this.onselected});
  final Meal meals;
  final int duration;
  final Complexity compelxity;
  final affordability affor;
  final void Function(Meal meal) onselected;

  String get compelextext {
    switch (compelxity) {
      case Complexity.simple:
        return 'simple';
        break;
      case Complexity.hard:
        return 'hard';
        break;
      case Complexity.challenging:
        return 'challenging';
        break;
    }
  }

  String get afforabltext {
    switch (affor) {
      case affordability.affordable:
        return 'afforable';
        break;
      case affordability.luxurious:
        return 'luxurious';
        break;
      case affordability.pricey:
        return 'pricey';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: ()=>onselected(meals),
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meals.imageurl),width: double.infinity,height: 300,fit: BoxFit.cover,),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 44),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          meals.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: Colors.black,
                                ),
                                Text(
                                  "$duration min",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.work,
                                  color: Colors.black,
                                ),
                                Text(
                                  "$compelextext",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.money,
                                  color: Colors.black,
                                ),
                                Text(
                                  "$afforabltext",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
