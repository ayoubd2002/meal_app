// ignore_for_file: public_member_api_docs, sort_constructors_first


enum Complexity { simple, challenging, hard }

enum affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageurl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexi;
  final affordability afforable;
  final bool isGluteenfree;
  final bool islactozefree;
  final bool isvegan;
  final bool isvegetarian;
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageurl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexi,
    required this.afforable,
    required this.isGluteenfree,
    required this.islactozefree,
    required this.isvegan,
    required this.isvegetarian,
  });
  


}
