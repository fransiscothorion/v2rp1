// ignore_for_file: avoid_print, unused_field, unrelated_type_equality_checks, unnecessary_new, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unnecessary_null_comparison

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/BE/controller.dart';
import 'package:v2rp1/BE/reqip.dart';
import 'package:v2rp1/BE/resD.dart';
import 'package:v2rp1/FE/VB/vendor_scanner.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class VendorBarcode extends StatefulWidget {
  const VendorBarcode({Key? key}) : super(key: key);

  @override
  State<VendorBarcode> createState() => _VendorBarcodeState();
}

class _VendorBarcodeState extends State<VendorBarcode> {
  static var hasilSearch;
  static var conve = MsgHeader.conve;
  static var trxid = MsgHeader.trxid;
  static var datetime = MsgHeader.datetime;
  static TextControllers textControllers = Get.put(TextControllers());
  static var searchVal = textControllers.vendor1Controller.value.text;
  static var serverKeyValue;

  late List _dataaa = <ResultData>[];

  Future<String> getData(String searchVal) async {
    var searchValue = searchVal;
    var sendSearch = await http.post(Uri.https('www.v2rp.net', '/ptemp/'),
        headers: {'x-v2rp-key': '$conve'},
        body: jsonEncode({
          "trxid": "$trxid",
          "datetime": "$datetime",
          "reqid": "0002",
          "id": "$searchValue"
        }));
    setState(() {
      _dataaa = json.decode(sendSearch.body)['result'];
    });
    print(sendSearch.body);

    final resultData = resultDataFromMap(sendSearch.body);
    // print(resultData.serverkey);
    serverKeyValue = resultData.serverkey;
    print(serverKeyValue);
    return "Successfull";
  }

  @override
  void initState() {
    super.initState();
    // futurePost = ResultData as Future<List<ResultData>>;
  }

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
          title: const Text("Vendor Barcode"),
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
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Vendor Barcode Registration',
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
                  controller: textControllers.vendor1Controller.value,
                  // controller: vendor_contler.clear(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.assignment),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        searchProcess();
                      },
                      splashColor: Colors.green,
                      tooltip: 'Search',
                      hoverColor: Colors.green,
                    ),
                    hintText: 'Stock Code / Stock Name',
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
                  children: [
                    const Text('Item List'),
                    const SizedBox(height: 15.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _dataaa == null ? 0 : _dataaa.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_dataaa[index]['itemname']),
                            subtitle: Text(_dataaa[index]['stockid']),
                            trailing: IconButton(
                              icon: const Icon(Icons.qr_code_2),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ScanVb(
                                    idstock: _dataaa[index]['stockid'],
                                    itemname: _dataaa[index]['itemname'],
                                    serverKeyVal: serverKeyValue,
                                  ),
                                ));
                              },
                              color: Colors.white,
                              hoverColor: Colors.green,
                              splashColor: Colors.green,
                            ),
                            tileColor: HexColor('#E6BF00'),
                            textColor: Colors.white,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> searchProcess() async {
    var searchResult = textControllers.vendor1Controller.value.text;
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
              "Please Enter Valid Stock Code / Item Name",
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
}
