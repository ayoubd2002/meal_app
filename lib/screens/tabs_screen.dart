import 'package:appmeal/models/meals.dart';
import 'package:appmeal/screens/category_screen.dart';
import 'package:appmeal/screens/filter_screen.dart';
import 'package:appmeal/screens/meals_screens.dart';
import 'package:appmeal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class tabscreen extends StatefulWidget {
  const tabscreen({super.key});

  @override
  State<tabscreen> createState() => _tabscreenState();
}

class _tabscreenState extends State<tabscreen> {
  int selectedpage = 0;
  void selected(int index) {
    setState(() {
      selectedpage = index;
    });
  }

  void showmessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  List<Meal> favoritelist = [];
  void toggelfavorite(Meal meal) {
    var exist = favoritelist.contains(meal);
    if (exist) {
      setState(() {
        favoritelist.remove(meal);
      });
      showmessage('remove from favorait list secss');
    } else {
      setState(() {
        favoritelist.add(meal);
      });
      showmessage('add to  favorite list');
    }
  }

  void navigate(String mess) {
    if (mess == 'meal') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => filterscreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activescreen = categoryscreen(
      ontoggel: toggelfavorite,
    );
    var activetitle = 'Categorys';
    if (selectedpage == 1) {
      activescreen = mealsscreen(
        meals: favoritelist,
        ontoggel: toggelfavorite,
      );
      activetitle = 'favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      body: activescreen,
      drawer: maindrawer(
        navigate: navigate,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: selected,
          currentIndex: selectedpage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'categorys'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorite'),
          ]),
    );
  }
}
