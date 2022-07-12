// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/ST/stock_transfer2.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
import 'package:v2rp1/additional/filter.dart';
import 'package:v2rp1/additional/list_MU.dart';

class StockTransfer extends StatefulWidget {
  const StockTransfer({Key? key}) : super(key: key);

  @override
  State<StockTransfer> createState() => _StockTransferState();
}

class _StockTransferState extends State<StockTransfer> {
  final controller = TextEditingController();
  List<ListMU> muList = allListMU;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are u sure?'),
            content: const Text('Do you want to exit the App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        throw (e);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Stock Transfer"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const Navbar()),
              // );
              Get.to(Navbar());
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Row(
                    // alignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Stock Transfer List",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const FilterData(
                                  reload: 'Reload',
                                );
                              });
                        },
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 15,
                            color: HexColor('#E6BF00'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('CREATE NEW'),
            ),
            onPressed: () async {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const StockTransfer2(),
              //   ),
              // );
              Get.to(StockTransfer2());
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: HexColor('#E6BF00'),
            ),
          ),
        ),
      ),
    );
  }
}
