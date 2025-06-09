import 'package:appmeal/screens/category_screen.dart';
import 'package:appmeal/screens/tabs_screen.dart';
import 'package:appmeal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class filterscreen extends StatefulWidget {
  const filterscreen({super.key});

  @override
  State<filterscreen> createState() => _filterscreenState();
}

class _filterscreenState extends State<filterscreen> {
  bool isGluteenfree = true;
  bool islactozefree = true;
  bool isvegan = true;
  bool isvegetarian = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filter screen '),
      ),
      drawer: maindrawer(
        navigate: (identier) {
          if (identier == 'meal') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => tabscreen()));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      body: Column(
        children: [
          customswitch(context, 'isGluteenfree', 'only foood dont have gluteen',
              (bool value) {
            setState(
              () {
                isGluteenfree = value;
              },
            );
          }, isGluteenfree),
          customswitch(context, 'islactozefree', 'only foood dont have gluteen',
              (bool value) {
            setState(() {
              islactozefree = value;
            });
          }, islactozefree),
          customswitch(context, 'isvegan', 'only foood dont have gluteen',
              (bool value) {
            setState(() {
              isvegan = value;
            });
          }, isvegan),
          customswitch(context, 'isvegetarian', 'only foood dont have gluteen',
              (bool value) {
            setState(() {
              isvegetarian = value;
            });
          }, isvegetarian),
        ],
      ),
    );
  }

  SwitchListTile customswitch(BuildContext context, title, subtitle,
      Function(bool newvalue) onchaged, bool filter) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: EdgeInsets.only(left: 30, right: 22),
        value: filter,
        onChanged: onchaged);
  }
}
