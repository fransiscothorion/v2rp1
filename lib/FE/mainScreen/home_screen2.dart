// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/FA/fixasset.dart';
import 'package:v2rp1/FE/GR/goods_receive.dart';
import 'package:v2rp1/FE/IT/internal_transfer.dart';
import 'package:v2rp1/FE/MU/scan_mu.dart';
import 'package:v2rp1/FE/SM/stock_movement.dart';
import 'package:v2rp1/FE/SO/stock_opname.dart';
import 'package:v2rp1/FE/ST/stock_transfer.dart';
import 'package:v2rp1/FE/StockTable/stocktable.dart';
import 'package:v2rp1/FE/VB/vendor_barcode.dart';

// ignore: must_be_immutable
class HomeScreenn extends StatelessWidget {
  const HomeScreenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      // onWillPop: () async => false,
      onWillPop: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are u sure?'),
            content: Text('Do you want to exit the App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Yes'),
              ),
            ],
          ),
        );
        throw (e);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("V2RP"),
          elevation: 0,
          backgroundColor: HexColor("#E6BF00"),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.2,
                decoration: BoxDecoration(
                    color: HexColor("#E6BF00"),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(46),
                      bottomRight: Radius.circular(46),
                    )),
              ),
              Positioned(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 100,
                  ),
                  height: size.height * 0.80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 60,
                        color: Colors.grey.withOpacity(0.20),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///////////////////row pertama
                        SizedBox(height: 10.0),
                        Text(
                          'Main Menu',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_gr.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(GoodsReceive());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Goods Received')
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_mu.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(ScanWh());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Material Use')
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_it.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(InternalTransfer());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Internal Transfer')
                              ],
                            ),
                          ],
                        ),
                        /////////////////////////Row kedua
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_sm.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(StockMovement());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Stock Movement')
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_st.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(StockTransfer());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Stock Transfer')
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(20),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Ink.image(
                                    image: AssetImage('images/ic_st.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                    child: InkWell(
                                      splashColor: Colors.black38,
                                      onTap: () async {
                                        Get.to(StockOpname());
                                      },
                                    ),
                                  ),
                                ),
                                Text('Stock Opname')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Ink.image(
                                      image: AssetImage(
                                          'images/barcoderegist.png'),
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.fill,
                                      child: InkWell(
                                        splashColor: Colors.black38,
                                        onTap: () async {
                                          Get.to(() => VendorBarcode());
                                        },
                                      ),
                                    ),
                                  ),
                                  Text('Barcode'),
                                  Text('Registration'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Ink.image(
                                      image: AssetImage('images/ic_st.png'),
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.fill,
                                      child: InkWell(
                                        splashColor: Colors.black38,
                                        onTap: () async {
                                          Get.to(() => StockTable());
                                        },
                                      ),
                                    ),
                                  ),
                                  Text('Stock'),
                                  Text('Table'),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Ink.image(
                                      image:
                                          AssetImage('images/fixedassets.png'),
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.fill,
                                      child: InkWell(
                                        splashColor: Colors.black38,
                                        onTap: () async {
                                          Get.to(() => FixAsset());
                                        },
                                      ),
                                    ),
                                  ),
                                  Text('Fixed'),
                                  Text('Assets'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
