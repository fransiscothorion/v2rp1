import 'package:flutter/material.dart';

class ListItemMU extends StatefulWidget {
  const ListItemMU({Key? key}) : super(key: key);

  @override
  State<ListItemMU> createState() => _ListItemMUState();
}

class _ListItemMUState extends State<ListItemMU> {
  List<ListTile> items = [
    const ListTile(
      title: Text("Title"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <ListTile>[
        items[0],
      ],
    );
  }
}
