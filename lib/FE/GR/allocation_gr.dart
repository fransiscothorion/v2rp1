import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../additional/constants.dart';

class AllocationGR extends StatefulWidget {
  final String title, descriptions, text, home;

  const AllocationGR({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    required this.home,
  }) : super(key: key);

  @override
  _AllocationGRState createState() => _AllocationGRState();
}

class _AllocationGRState extends State<AllocationGR> {
  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Material Use'),
    ItemChoice(2, 'Internal Transfer'),
    ItemChoice(3, 'Stock Inventory'),
  ];
  var idSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          // margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "New Allocation",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Wrap(
                children: listChoices
                    .map((e) => ChoiceChip(
                          label: Text(e.label),
                          selected: idSelected == e.id,
                          onSelected: (_) => setState(() => idSelected = e.id),
                        ))
                    .toList(),
                spacing: 8,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'To Warehouse',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Input QTY',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8.0),
                        backgroundColor: HexColor('#E6BF00'),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.home,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
