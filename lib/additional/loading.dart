import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v2rp1/FE/mainScreen/login_screen2.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';

String? finalUsername;

class LoadingScreen2 extends StatefulWidget {
  const LoadingScreen2({Key? key}) : super(key: key);

  @override
  State<LoadingScreen2> createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      // Timer(
      // const Duration(seconds: 2),
      // (() => Get.to(
      //       // finalUsername == null ? const LoginPage() : const Navbar(),
      //     )),
      // );
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainUsername = sharedPreferences.getString('username');
    setState(() {
      finalUsername = obtainUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return finalUsername == null ? const LoginPage() : const Navbar();
  }
}
