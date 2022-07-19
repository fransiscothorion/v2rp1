// ignore_for_file: avoid_print, unused_field, unrelated_type_equality_checks, unnecessary_new, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unnecessary_null_comparison, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/BE/controller.dart';
import 'package:v2rp1/BE/reqip.dart';
import 'package:v2rp1/BE/resD.dart';
import 'package:v2rp1/FE/StockTable/stocktable_scanner.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class StockTable extends StatefulWidget {
  const StockTable({Key? key}) : super(key: key);

  @override
  State<StockTable> createState() => _StockTableState();
}

class _StockTableState extends State<StockTable> {
  static var hasilSearch;
  static var conve = MsgHeader.conve;
  static var trxid = MsgHeader.trxid;
  static var datetime = MsgHeader.datetime;
  static TextControllers textControllers = Get.put(TextControllers());
  static var searchVal = textControllers.stocktableController.value.text;
  static var serverKeyValue;
  static TextField codebar = TextField();

  static late List _dataaa = <ResultData>[];
  // late final List _dataaa1 = <ResultData>[];
  // late final List _dataaa1 = widget.data;

  Future<String> getData(String searchVal) async {
    String? searchValue = searchVal;
    var sendSearch = await http.post(Uri.https('www.v2rp.net', '/ptemp/'),
        headers: {'x-v2rp-key': '$conve'},
        body: jsonEncode({
          "trxid": "$trxid",
          "datetime": "$datetime",
          "reqid": "0002",
          "id": "$searchValue"
        }));
    print(searchValue);
    setState(() {
      _dataaa = json.decode(sendSearch.body)['result'];
      textControllers.fixassetController.value.clear();
    });
    print(sendSearch.body);
    // print(_dataaa);

    final resultData = resultDataFromMap(sendSearch.body);
    serverKeyValue = resultData.serverkey;
    print(serverKeyValue);
    return "Successfull";
  }

  @override
  void initState() {
    super.initState();
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
          title: const Text("Stock Table"),
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
                      'Stock Table',
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
                  controller: textControllers.stocktableController.value,
                  onSubmitted: (value) {
                    searchProcess();
                    setState(() {
                      _dataaa.clear();
                      // textControllers.stocktableController.value.clear();
                    });
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
                    hintText: 'Stock Code / Item Name',
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
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
    var searchResult = textControllers.stocktableController.value.text;
    try {
      if (searchResult.length >= 3) {
        getData(searchVal);
      } else {
        Get.snackbar(
          "Error",
          "Please Enter Valid Stock Code / Item Name",
          icon: Icon(Icons.close),
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
