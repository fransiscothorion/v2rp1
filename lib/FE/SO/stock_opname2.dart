// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/SO/detail_so.dart';
import 'package:v2rp1/FE/SO/stock_opname.dart';
import 'package:v2rp1/FE/SO/stock_opname3.dart';

import '../../additional/scanner.dart';

class StockOpname2 extends StatefulWidget {
  const StockOpname2({Key? key}) : super(key: key);

  @override
  State<StockOpname2> createState() => _StockOpname2State();
}

class _StockOpname2State extends State<StockOpname2> {
  final controller_wh = TextEditingController();
  final controller_sppbj = TextEditingController();

  bool isVisible = false;

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
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const BarcodeScannerWithController(),
              // ));
              Get.to(BarcodeScannerWithController());
            },
            elevation: 12,
            tooltip: 'Add Item',
            hoverColor: Colors.blue,
            backgroundColor: HexColor('#E6BF00'),
            foregroundColor: Colors.white,
            splashColor: Colors.black45,
            child: const Icon(Icons.add),
            // highlightElevation: 50,
          ),
        ),
        appBar: AppBar(
          title: const Text("Stock Opname"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const StockOpname()),
              // );
              Get.to(StockOpname());
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: controller_wh,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.warehouse),
                    hintText: 'Warehouse',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.qr_code_scanner),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) =>
                        //       const BarcodeScannerWithController(),
                        // ));
                        Get.to(BarcodeScannerWithController());
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 10.0),
                // TextField(
                //   controller: controller_sppbj,
                //   decoration: InputDecoration(
                //     prefixIcon: const Icon(Icons.article),
                //     hintText: 'Reff No.',
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide: const BorderSide(color: Colors.black)),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                TextButton(
                  onPressed: () => setState(() => isVisible = !isVisible),
                  child: const Text('Load Data'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: HexColor('#E6BF00'),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Colors.black,
                        thickness: 0.8,
                        height: 25,
                      ),
                      const Text('Item List'),
                      const SizedBox(height: 15.0),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 5.0),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Bilge Alam 10298'),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AddDetailSo(
                                        title: "SUBMIT DATA SUCCESFUL",
                                        descriptions:
                                            "Internal Transfer No.STTR/NEP/2022/03-000158",
                                        text: "Home",
                                        home: "OK",
                                      );
                                    });
                              },
                              child: Text(
                                "Detail",
                                style: TextStyle(color: HexColor("#E6BF00")),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("AAA043"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Qty Stock Card : 10"),
                                Text(
                                  "Qty OpName : 10",
                                  style: TextStyle(
                                    color: Color.fromARGB(122, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  "Qty Different : 0",
                                  style: TextStyle(
                                    color: Color.fromARGB(122, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('SAVE DATA'),
              ),
              onPressed: () async {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     // builder: (context) => const StockOpname3(),
                //     builder: (context) => const StockOpname3(),
                //   ),
                // );
                Get.to(StockOpname3());
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: HexColor('#E6BF00'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
