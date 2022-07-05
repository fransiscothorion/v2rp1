import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../additional/constants.dart';

class AddDetailMu extends StatefulWidget {
  final String title, descriptions, text, home;

  const AddDetailMu({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    required this.home,
  }) : super(key: key);

  @override
  _AddDetailMuState createState() => _AddDetailMuState();
}

class _AddDetailMuState extends State<AddDetailMu> {
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
              // const Text(
              //   "Add Detail",
              //   style: TextStyle(fontWeight: FontWeight.w800),
              // ),
              const SizedBox(
                height: 15,
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     labelText: 'Rack',
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              const Text(
                "Edit Quantity",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //   width: 150,
                  //   height: 40,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       labelText: 'Stock Card',
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   width: 150,
                  //   height: 40,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10)),
                  //         labelText: 'OpName'),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Edit Quantity'),
                    ),
                  ),
                ],
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
