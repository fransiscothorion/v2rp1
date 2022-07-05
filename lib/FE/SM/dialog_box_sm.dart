import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/SM/stock_movement.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
// import 'package:v2rp1/FE/home_screen2.dart';

import '../../additional/constants.dart';
// import '../mainScreen/home_screen2.dart';

class CustomDialogBoxSM extends StatefulWidget {
  final String title, descriptions, text, home;
  final Image img;

  const CustomDialogBoxSM({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    required this.home,
    required this.img,
  }) : super(key: key);

  @override
  _CustomDialogBoxSMState createState() => _CustomDialogBoxSMState();
}

class _CustomDialogBoxSMState extends State<CustomDialogBoxSM> {
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
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
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
            children: <Widget>[
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Navbar(),
                            ),
                          );
                        },
                        child: Text(
                          widget.text,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.green),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StockMovement(),
                            ),
                          );
                        },
                        child: Text(
                          widget.home,
                          style: TextStyle(
                              fontSize: 18, color: HexColor('#E6BF00')),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.avatarRadius)),
                child: Image.asset("images/success.gif")),
          ),
        ),
      ],
    );
  }
}
