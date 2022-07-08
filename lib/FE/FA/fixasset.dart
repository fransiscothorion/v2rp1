// ignore_for_file: avoid_print, unused_field, unrelated_type_equality_checks, unnecessary_new, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unnecessary_null_comparison

import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/BE/FAres.dart';
import 'package:v2rp1/BE/controller.dart';
import 'package:v2rp1/BE/reqip.dart';
import 'package:v2rp1/BE/resD.dart';
import 'package:v2rp1/FE/StockTable/stocktable_scanner.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class FixAsset extends StatefulWidget {
  const FixAsset({Key? key}) : super(key: key);

  @override
  State<FixAsset> createState() => _FixAssetState();
}

class _FixAssetState extends State<FixAsset> {
  static var hasilSearch;
  static var conve = MsgHeader.conve;
  static var trxid = MsgHeader.trxid;
  static var datetime = MsgHeader.datetime;
  static TextControllers textControllers = Get.put(TextControllers());
  static var searchVal = textControllers.fixassetController.value.text;
  static var serverKeyValue;

  late List _dataaa = <FixAsset>[];
  late final List _dataaa1 = <FixAsset>[];
  late List _foto;

  Future<String> getData(String searchVal) async {
    var searchValue = searchVal;
    var sendSearch = await http.post(Uri.https('www.v2rp.net', '/ptemp/'),
        headers: {'x-v2rp-key': '$conve'},
        body: jsonEncode({
          "trxid": "$trxid",
          "datetime": "$datetime",
          "reqid": "501001",
          "id": "$searchValue"
        }));
    setState(() {
      _dataaa = json.decode(sendSearch.body)['result'];
    });
    print(sendSearch.body);

    final fixAsset = fixAssetFromMap(sendSearch.body);
    serverKeyValue = fixAsset.serverkey;
    print(serverKeyValue);

    // final resultData = resultDataFromMap(sendSearch.body);
    // serverKeyValue = resultData.serverkey;
    // print(serverKeyValue);
    return "Successfull";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          title: const Text("Fix Assets"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Navbar()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Fix Assets',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: textControllers.fixassetController.value,
                  onSubmitted: (value) {
                    searchProcess();
                  },
                  // controller: vendor_contler.clear(),
                  onChanged: (value) {
                    if (value == value) {
                      InputDecoration(
                          suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            Get.deleteAll();
                          });
                        },
                      ));
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.assignment),
                    // suffixIcon: ,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.qr_code_2),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScanSTable(),
                        ));
                      },
                      splashColor: Colors.green,
                      tooltip: 'Scan',
                      hoverColor: Colors.green,
                    ),
                    hintText: 'FA Number / Item Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.8,
                  height: 25,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Item List'),
                      const SizedBox(height: 15.0),
                      Container(
                        height: size.height / 1.5,
                        // width: size.width / 1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          // physics: const NeverScrollableScrollPhysics(),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              // height: 20,
                              width: 20,
                            );
                          },
                          shrinkWrap: true,
                          // itemCount: 3,
                          itemCount: _dataaa.length,
                          itemBuilder: (context, index) {
                            // _foto = _dataaa[index]['imgdir'];
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shadowColor: HexColor('#E6BF00'),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Ink.image(
                                        image: NetworkImage(
                                          'https://v2rp.net/' +
                                              _dataaa[index]['imagedir'],
                                        ),
                                        height: 300,
                                        width: 350,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Container(
                                          color: HexColor('#E6BF00'),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              _dataaa[index]['description'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      bottom: 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'F/Assets No.    ',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Description',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Category',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Brand',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Made In',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Reff.No.',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Req.No.',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'P/O No.',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Request By',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Serial No.',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _dataaa[index]['fadatano'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['description'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['category'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['brandname'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['countryname'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['reffno'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['reqno'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['pono'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['requestby'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['serialno'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              _dataaa[index]['locationname'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> searchProcess() async {
    var searchResult = textControllers.fixassetController.value.text;
    try {
      if (searchResult.length >= 3) {
        getData(searchVal);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            elevation: 10.0,
            shape: Border.all(
                color: const Color.fromARGB(255, 192, 0, 0),
                width: 0.5,
                style: BorderStyle.solid),
            content: const Text(
              "Please Enter Valid FA Number / Item Name",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  listData() async {
    if (_dataaa.length != null) {
      return ListView.builder(
        shrinkWrap: true,
        // itemCount: _dataaa == null ? 0 : _dataaa.length,
        itemCount: _dataaa.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_dataaa[index]['itemname']),
              subtitle: Text(_dataaa[index]['stockid']),
              tileColor: HexColor('#E6BF00'),
              textColor: Colors.white,
            ),
          );
        },
      );
    } else if (_dataaa1.length != null) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _dataaa1.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_dataaa1[index]['itemname']),
              subtitle: Text(_dataaa1[index]['stockid']),
              tileColor: HexColor('#E6BF00'),
              textColor: Colors.white,
            ),
          );
        },
      );
    }
  }
}
