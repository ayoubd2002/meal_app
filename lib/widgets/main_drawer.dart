import 'dart:ffi';

import 'package:flutter/material.dart';

class maindrawer extends StatelessWidget {
  const maindrawer({super.key, required this.navigate});
  final void Function(String identifier) navigate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 50,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Coocking up ..',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            navigate('meal');
          },
          leading: Icon(
            Icons.restaurant,
            color: Colors.white,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            navigate('filter');
          },
          leading: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
