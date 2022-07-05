import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/mainScreen/home_screen2.dart';

// import '../mainScreen/home_screen2.dart';
import '../mainScreen/setting_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  final screen = [const HomeScreenn(), const SettingScreen()];
  final GlobalKey _key = GlobalKey();
  GlobalKey getKey() => _key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: getKey(),
        index: selectedIndex,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: HexColor("#E6BF00"),
        buttonBackgroundColor: HexColor('#E6BF00'),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 450),
        height: 70,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: screen[selectedIndex],
    );
  }
}
